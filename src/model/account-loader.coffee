module.factory 'AccountLoader', (Account) ->

  loadAccount: (fileName) ->
    Account.getFromJSON(JSON.parse(localStorage.getItem(fileName)))

  storeAccount: (fileName, account) ->
    console.log "Storing account"
    localStorage.setItem(fileName, JSON.stringify(account))
    null