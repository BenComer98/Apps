import { useContext } from 'react';
import StatsContext from '../context/stats';
import ChildOpt from './ChildOpt';
import AvatarOpt from './AvatarOpt';
import OtherOpt from './OtherOpt';

function Options() {
    const { isChild } = useContext(StatsContext);
    console.log(isChild);


    return (
        <div>
            {!isChild ? null : <ChildOpt />}
            <AvatarOpt />
            <OtherOpt />
        </div>
    );
}

export default Options;