import React from 'react';
import ralogo from '../../media/images/ralogo.png';


export default function Landing() {
    return (
        <div className="landing">
            <button className="landing-button">
                <img className="landing-logo" src={ralogo} alt="ra-logo"/>
            </button>
            <h1 className="landing-text">Rupert Adams</h1>
            <h3 className="landing-text">Data Engineer</h3>
            <div className="landing-footer">
                <a href="mailto: RupertNCAdams@aol.com"><i className="fas fa-envelope-open-text"></i></a>
                <a href="https://twitter.com/Rupieeroo"><i className="fab fa-twitter"></i></a>
                <a href="https://www.github.com/rupieeroo"><i className="fab fa-github"></i></a>
            </div>
        </div>
    )
}
