module.factory 'AccountLoader', (Account) ->

  loadAccount: (fileName) ->
    out.verbose "Loading account from previous session"
    Account.getFromJSON(JSON.parse(localStorage.getItem(fileName)))

  storeAccount: (fileName, account) ->
    out.verbose "Saving account"
    localStorage.setItem(fileName, JSON.stringify(account))