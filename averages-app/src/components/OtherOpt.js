import { useState, useContext } from 'react';
import StatsContext from '../context/stats';
import DebugMenu from './DebugMenu';

function OtherOpt() {
    const { aptitude, toggleAptitude, eternalSeals, incrementEternalSeals, decrementEternalSeals } = useContext(StatsContext);

    const [otherOptsEnabled, setOtherOptsEnabled] = useState(false);
    const handleShowClick = () => {
        setOtherOptsEnabled(!otherOptsEnabled);
    }

    const handleAptitudeClick = () => {
        toggleAptitude();
    }

    const aptitudeText = aptitude ? 'Aptitude: On' : 'Aptitude: Off';
    const showButtonText = otherOptsEnabled ? 'Hide advanced options' : 'Show advanced options';
    
    const showButton = (
        <button onClick={handleShowClick}>{showButtonText}</button>
    );

    const otherOptsHTML = (
        <div>
            {!otherOptsEnabled ? null : 
                <div>
                    <div>
                        <button onClick={handleAptitudeClick}>{aptitudeText}</button>
                    </div>
                    <div>
                        Eternal Seals:
                        <button onClick={incrementEternalSeals}>+</button>
                        {eternalSeals}
                        <button onClick={decrementEternalSeals}>-</button>
                    </div>
                    <div>
                        <DebugMenu />
                    </div>
                </div>
            }
            {showButton}
        </div>
    );

    return otherOptsHTML;
}

export default OtherOpt;