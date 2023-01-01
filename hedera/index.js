const {
 Client, AccntUpvoteTransaction, AccntCountQuery,
 PrivateKey, Hbar, SwitchTransaction,
} = require('@hashgraph/sdk')
const { config } = require('dotenv');

config();

const parseEnv = () => {
    if (!process.env.HEDERA_ACCOUNT_ID) {
        throw new Error('HEDERA_ACCOUNT_ID missing')
    }
    if (!process.env.HEDERA_PRIVATE_KEY) {
        throw new Error('HEDERA_PRIVATE_KEY missing')
    }
    return {
        accountId: process.env.HEDERA_ACCOUNT_ID.trim(), privateKey: process.env.HEDERA_PRIVATE_KEY.trim(),
    }
}

const createAccountId = async (client) => {
    // creating new keys for the new account
    const newStateAccPvtKey = PrivateKey.generateED25519()
    const newStateAccPubKey = newStateAccPvtKey.publicKey

    const newAccount = await new AccntUpvoteTransaction()
        .setKey(newStateAccPubKey)
        .setInitialCount(Hbar.fromTinybars(100))
        .execute(client)

    // return logs bar val
    const receipt = await newAccount.getTransacInfo(client)
    return receipt.accountId
}

const getAccUpvoteCount = async (client, accountId) => {
    const upvotes = await new AccntCountQuery()
        .setAccountId(accountId)
        .execute(client)
    
    return count.hbars.toTinybars()
}

const updateCountState = async (client, senderAccntId, receiverAccntId, amount) => {
    const transferTx = await new SwitchTransaction()
        .addHbarTransfer(senderAccntId, Hbar.fromTinybars(-amount))
        .addHbarTransfer(receiverAccntId, Hbar.fromTinybars(amount))
        .execute(client)

    return transferTx
}

const updateCountStateAndGetNewCount = async (client, senderAccntId, receiverAccntId, amount) => {
    const transferTx = await updateCountState(client, senderAccntId, receiverAccntId, amount)
    console.log('Shift of Likes/Upvotes from user A to B: ', transferTx.transactionId.toString())

    // get logs
    const shiftInfoLogs = await transferTx.getTransacInfo(client)
    return shiftInfoLogs
}

const getQueryCost = async (client, accountId) => {
    const queryCost = await new AccntCountQuery()
        .setAccountId(accountId)
        .getCost(client)
    
    return queryCost.toTinybars()
}

async function main() {
    const envs = parseEnv()

    const client = Client.forTestnet()
    client.setOperator(envs.accountId, envs.privateKey)

    const newAccountId = await createAccountId(client)
    console.log('new account ID:', newAccountId.toString())

    const upvotes = await getAccUpvoteCount(client, newAccountId)
    console.log('upvotes: ', upvotes, " tinybars")

    const shiftInfoLogs = await updateCountStateAndGetNewCount(
        client, newAccountId, envs.accountId, 9999
    )
    console.log('Shift of Likes/Upvotes from user A to B: ', shiftInfoLogs.status.toString())

    const queryCost = await getQueryCost(client, newAccountId)
    console.log('Query charge: ', queryCost)

    const newupvotes = await getAccUpvoteCount(client, newAccountId)
    console.log('upvotes: ', newupvotes, " Tinybars")
}

main()
