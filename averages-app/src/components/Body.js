import { useContext } from 'react';
import StatsContext from '../context/stats';
import Options from './Options';
import Reset from './Reset';
import Display from './Display';

function Body() {
    const { initializeUnit } = useContext(StatsContext);

    const handleUnitSelect = (event) => {
        initializeUnit(event.target.id);
    }

    return (
        <div>
            <div>
                Unit: <select onChange={handleUnitSelect}>
                    <option label="Avatar" value="Avatar!F" id={0} />
                    <option label="Jakob" value="Jakob!1" id={2} />
                    <option label="Felicia" value="Felicia!1" id={3} />
                    <option label="Elise" value="Elise" id={4} />
                    <option label="Dwyer" value="Dwyer" id={31} />
                </select>
            </div>
            <div>
                <Options />
                <Reset />
                <Display />
            </div>
        </div>
    );
}

export default Body;