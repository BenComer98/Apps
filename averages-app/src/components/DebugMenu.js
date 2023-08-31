import sqlConnect from '../hooks/sqlConnect';

function DebugMenu() {
    return (
        <button onClick={sqlConnect} >Reset Table Structure</button>
    );
};

export default DebugMenu;