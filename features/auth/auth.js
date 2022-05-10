const {Given, When, Then} = require('cucumber');

Given('I am on the login page', function () {

});

When('I send request with correct credentials', function () {
    // Post credentials to authentificate route
    this.request.post('/authenticate', {
        email: 'user@technique',
        password: 'password'
    });
});
