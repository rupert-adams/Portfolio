module.exports = {
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: /node_modules/,
                use: {
                    loader: "babel-loader",
                }
            },
            {
                test: /\.(png|ico)$/,
                loader: 'file-loader?name=../../static/frontend/media/images/[name].[ext]'
            }
        ]
    }
}