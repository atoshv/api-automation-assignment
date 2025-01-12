function fn() {
    var config = {
        baseUrl: 'https://reqres.in/api/v1',
        mockData: {
            user: {
                "email": "eve.holt@reqres.in",
                "password": "pistol"
            },
            product: {
                "name": "New Product",
                "price": 100,
                "description": "A test product"
            },
            token: "some_valid_token"
        }
    };
    return config;
}
