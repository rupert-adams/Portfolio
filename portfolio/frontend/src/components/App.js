import React, { Component, Fragment } from 'react';
import ReactDOM from 'react-dom';

import Header from './layout/Header';
import Contact from './contact/Contact';

class App extends Component {
    render() {
        return (
            <Fragment>
                <Header />
                <div className="container">
                    <Contact />
                </div>
            </Fragment>
        )
    }
}

ReactDOM.render(<App />, document.getElementById('app'));