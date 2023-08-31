import { createContext, useState } from 'react';
import axios from 'axios';

const StatsContext = createContext();

function Provider({ children }) {
    const [ unit, setUnit ] = useState(0);
    const [ statInfo, setStatInfo ] = useState({});
    const [ classesInfo, setClassesInfo ] = useState([]);
    // The type of promotion this unit can receive, or is prepromoted.
    // 0: Unknown
    // 1: Unpromoted
    // 2: Promoted
    // 3: Special (Jakob, Felicia, Songstress)
    const [ promotedType, setPromotedType ] = useState(0);
    const [ isChild, setIsChild ] = useState(false);
    const [ mother, setMother ] = useState(null);
    const [ isAvatar, setIsAvatar ] = useState(false);
    const [ avatarOpts, setAvatarOpts ] = useState({boon: 'HP', bane: 'STR', talent: 1});
    const [ aptitude, setAptitude ] = useState(false);
    const [ eternalSeals, setEternalSeals ] = useState(0);

    const initializeUnit = async ( id ) => {
        clearClassInfo();
        setMother(null);
        await fetchStatInfo(id);
        console.log("Hit here!");
        console.log(`statInfo.bases: ${statInfo.bases}`);
        addClassInfo(statInfo.bases.class);
    }

    const fetchStatInfo = async ( id ) => {
        const responseGeneral = await axios.get(`http://localhost:3001/characters?id=${id}`);
        const responseBases = await axios.get(`http://localhost:3001/bases?id=${id}`);
        const responseGrowths = await axios.get(`http://localhost:3001/growths?id=${id}`);
        const responseMaxMods = await axios.get(`http://localhost:3001/maxmods?id=${id}`);

        console.log(responseBases);

        setUnit(id);
        setIsChild(responseGeneral.data.isChild);
        // TODO: promoted type check

        setStatInfo(
            {
                bases: responseBases.data,
                growths: responseGrowths.data,
                maxMods: responseMaxMods.data
            }
        );
    };

    const addClassInfo = async ( id ) => {
        const response = await axios.get(`http://localhost:3001/classes?id=${id}`);

        setClassesInfo(
            [
                ...classesInfo,
                response.data
            ]
        );
    };

    const deleteClassInfo = ( id ) => {
        setClassesInfo(
            classesInfo.filter(( id ) => {
                return classesInfo.id != id;
            })
        );
    };

    const clearClassInfo = ( id ) => {
        setClassesInfo({});
    };

    const getPromotedClass = ( bases ) => {
        switch (bases.promotedType) {
            case 0:
                console.error('Default type cannot be zero. Assuming 2.');
                return null;
            case 1:
                return bases.defaultPromotion;
            case 2:
            case 3:
                return null;
            default: 
                console.error('Type outside bounds of enum. Assuming 2.');
                return null;
        }
    };

    const getDefaultClassInfo = ( id ) => {
        const defaultClass = statInfo.bases.class;
        setPromotedType(statInfo.bases.promotedType);
        const promotedClass = getPromotedClass( statInfo.bases );

        return {
            defaultClass,
            promotedClass
        };
    };

    const toggleAptitude = () => {
        setAptitude(aptitude => !aptitude);
    }

    const incrementEternalSeals = () => {
        setEternalSeals(Math.min(eternalSeals+1, 16));
    }

    const decrementEternalSeals = () => {
        setEternalSeals(Math.max(eternalSeals-1, 0));
    }

    /****************** CONTEXT PROVIDERS ******************/
    const statsContext = {
        statInfo, setStatInfo,
        classesInfo, setClassesInfo,
        promotedType, setPromotedType,
        isChild, setIsChild,
        mother, setMother,
        isAvatar, setIsAvatar,
        avatarOpts, setAvatarOpts,
        aptitude, toggleAptitude,
        eternalSeals, incrementEternalSeals, decrementEternalSeals,
        initializeUnit,
        addClassInfo,
        deleteClassInfo,
        clearClassInfo,
        getDefaultClassInfo
    };

    return (
        <StatsContext.Provider value={statsContext}>
            {children}
        </StatsContext.Provider>
    );
}

export { Provider };
export default StatsContext;