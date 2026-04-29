import { CDBContainer, CDBIcon, CDBInput } from 'cdbreact';
import {React, useState} from 'react';
import './filter.css';

export var MMCheck = false;
export var CFCheck = false;
export var KACheck = false;
export var ADCheck = false;
export var PRCheck = false;
export var SACheck = false;
export var VSCheck = false;
export var SPCheck = false;

const Filter = () => {
    const [MIcon, setIcon] = useState('eye-slash');
    const [CFIcon, setCFIcon] = useState('eye-slash');
    const [KAIcon, setKAIcon] = useState('eye-slash');
    const [ADIcon, setADIcon] = useState('eye-slash');
    const [PRIcon, setPRIcon] = useState('eye-slash');
    const [SAIcon, setSAIcon] = useState('eye-slash');
    const [VSIcon, setVSIcon] = useState('eye-slash');
    const [SPIcon, setSPIcon] = useState('eye-slash');
    
    
    const IconCH = () => {
        if(MIcon == 'check'){
            setIcon('eye-slash');
            MMCheck = false;
            // console.log('check:',MIcon);
        }else{
            setIcon('check');
            MMCheck = true;
            // console.log('circle: ',MIcon);
        }
    }
    const CFIconCH = () => {
        if(CFIcon == 'check'){
            setCFIcon('eye-slash');
            CFCheck=false;
            // console.log('check:',MIcon);
        }else{
            setCFIcon('check');
            CFCheck=true;
            // console.log('circle: ',MIcon);
        }
    }
    const KAIconCH = () => {
        if(KAIcon == 'check'){
            setKAIcon('eye-slash');
            KACheck=false;
        }else{
            setKAIcon('check');
            KACheck=true;
        }
    }
    const ADIconCH = () => {
        if(ADIcon == 'check'){
            setADIcon('eye-slash');
            ADCheck=false;
        }else{
            setADIcon('check');
            ADCheck=true;
        }
    }
    const PRIconCH = () => {
        if(PRIcon == 'check'){
            setPRIcon('eye-slash');
            PRCheck=false;
        }else{
            setPRIcon('check');
            PRCheck=true;
        }
    }
    const SAIconCH = () => {
        if(SAIcon == 'check'){
            setSAIcon('eye-slash');
            SACheck=false;
        }else{
            setSAIcon('check');
            SACheck=true;
        }
    }
    const VSIconCH = () => {
        if(VSIcon == 'check'){
            setVSIcon('eye-slash');
            VSCheck=false;
        }else{
            setVSIcon('check');
            VSCheck=true;
        }
    }
    const SPIconCH = () => {
        if(SPIcon == 'check'){
            setSPIcon('eye-slash');
            SPCheck=false;
        }else{
            setSPIcon('check');
            SPCheck=true;
        }
    }

    

    return <div class="containerFilter">
        <div class="col-8 titulo">
            <h1>Busqueda</h1>
        </div>
        <button class="col-12  generalFilter">
            <div class="col-3">
                <CDBIcon icon="check"></CDBIcon>
            </div>
            <div class="col-12 filterText">
                <p>General</p>
            </div>
        </button >
        {/* ADD A FOR EACH FOR EXAMS */}
        <button class="col-12 MMSEFilter examsFilter" onClick ={()=>{IconCH()}}>
            <div class="col-3">
                <CDBIcon icon={MIcon}></CDBIcon>
            </div>
            <div class="col-12 filterText">
                <p>Prueba MMSE</p>
            </div>
        </button>
        <button class="col-12 CFSFilter examsFilter" onClick ={()=>{CFIconCH()}}>
            <div class="col-3">
                <CDBIcon icon={CFIcon}></CDBIcon>
            </div>
            <div class="col-12 filterText">
                <p>CFS</p>
            </div>
        </button>
        <button class="col-12 KATZFilter examsFilter" onClick ={()=>{KAIconCH()}}>
            <div class="col-3">
                <CDBIcon icon={KAIcon}></CDBIcon>
            </div>
            <div class="col-12 filterText">
                <p>KATZ</p>
            </div>
        </button>
        <button class="col-12 ADGYFilter examsFilter" onClick ={()=>{ADIconCH()}}>
            <div class="col-3">
                <CDBIcon icon={ADIcon}></CDBIcon>
            </div>
            <div class="col-12 filterText">
                <p>ADGY</p>
            </div>
        </button>
        <button class="col-12 PRFilter examsFilter" onClick ={()=>{PRIconCH()}}>
            <div class="col-3">
                <CDBIcon icon={PRIcon}></CDBIcon>
            </div>
            <div class="col-12 filterText">
                <p>PR</p>
            </div>
        </button>
        <button class="col-12 SARCFFilter examsFilter" onClick ={()=>{SAIconCH()}}>
            <div class="col-3">
                <CDBIcon icon={SAIcon}></CDBIcon>
            </div>
            <div class="col-12 filterText">
                <p>SARCF</p>
            </div>
        </button>
        <button class="col-12 VSGFilter examsFilter" onClick ={()=>{VSIconCH()}}>
            <div class="col-3">
                <CDBIcon icon={VSIcon}></CDBIcon>
            </div>
            <div class="col-12 filterText">
                <p>VSG</p>
            </div>
        </button>
        <button class="col-12 SPPBFilter examsFilter" onClick ={()=>{SPIconCH()}}>
            <div class="col-3">
                <CDBIcon icon={SPIcon}></CDBIcon>
            </div>
            <div class="col-12 filterText">
                <p>SPPB</p>
            </div>
        </button>
    </div>
}

export default Filter; 