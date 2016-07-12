module.exports = {
    proxy: 'localhost:3000',
    files: [
        'develop/modules/**/*.{html,js}'
    ],
    notify: false,
    browser: 'google chrome',
    middleware: [
        morgan('dev'),
        function (req, res, next) {
            if (req.method !== 'POST')
                return next();
            return proxyMiddleware(req, res, next);
        }
    ]
};