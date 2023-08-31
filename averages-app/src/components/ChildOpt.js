import { useContext } from 'react';
import StatsContext from '../context/stats';

function ChildOpt() {
    const { mother, setMother } = useContext(StatsContext);
    

    return (
        <div>
            ChildOpt goes here!
        </div>
    );
}

export default ChildOpt;