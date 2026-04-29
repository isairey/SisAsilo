import {React, useState} from 'react';
import './userTable.css';
import {UserData} from './userInfo';
import { CDBContainer, CDBIcon, CDBInput } from 'cdbreact';

const UserTable = () => { 
    const [GIcon, setGIcon] = useState('eye-slash');
    const [MIcon, setIcon] = useState('eye-slash');
    const [CFIcon, setCFIcon] = useState('eye-slash');
    const [KAIcon, setKAIcon] = useState('eye-slash');
    const [ADIcon, setADIcon] = useState('eye-slash');
    const [PRIcon, setPRIcon] = useState('eye-slash');
    const [SAIcon, setSAIcon] = useState('eye-slash');
    const [VSIcon, setVSIcon] = useState('eye-slash');
    const [SPIcon, setSPIcon] = useState('eye-slash');
    const [MMCH, setMMCh] = useState(false);
    const [CFCH, setCFCh] = useState(false);
    const [KACH, setKACh] = useState(false);
    const [ADCH, setADCh] = useState(false);
    const [PRCH, setPRCh] = useState(false);
    const [SACH, setSACh] = useState(false);
    const [VSCH, setVSCh] = useState(false);
    const [SPCH, setSPCh] = useState(false);
    
    const GeneralCH = () => {
        if(GIcon == 'check'){
            setGIcon('eye-slash');
            setIcon('eye-slash');
            setMMCh(false);
            setCFIcon('eye-slash');
            setCFCh(false);
            setKAIcon('eye-slash');
            setKACh(false);
            setADIcon('eye-slash');
            setADCh(false);
            setPRIcon('eye-slash');
            setPRCh(false);
            setSAIcon('eye-slash');
            setSACh(false);
            setVSIcon('eye-slash');
            setVSCh(false);
            setSPIcon('eye-slash');
            setSPCh(false);
        }else{
            setGIcon('check');
            setIcon('check');
            setMMCh(true);
            setCFIcon('check');
            setCFCh(true);
            setKAIcon('check');
            setKACh(true);
            setADIcon('check');
            setADCh(true);
            setPRIcon('check');
            setPRCh(true);
            setSAIcon('check');
            setSACh(true);
            setVSIcon('check');
            setVSCh(true);
            setSPIcon('check');
            setSPCh(true);
        }
    }
    const IconCH = () => {
        if(MIcon == 'check'){
            setIcon('eye-slash');
            setMMCh(false);
        }else{
            setIcon('check');
            setMMCh(true);
        }
    }
    const CFIconCH = () => {
        if(CFIcon == 'check'){
            setCFIcon('eye-slash');
            setCFCh(false);
        }else{
            setCFIcon('check');
            setCFCh(true);
        }
    }
    const KAIconCH = () => {
        if(KAIcon == 'check'){
            setKAIcon('eye-slash');
            setKACh(false);
        }else{
            setKAIcon('check');
            setKACh(true);
        }
    }
    const ADIconCH = () => {
        if(ADIcon == 'check'){
            setADIcon('eye-slash');
            setADCh(false);
        }else{
            setADIcon('check');
            setADCh(true);
        }
    }
    const PRIconCH = () => {
        if(PRIcon == 'check'){
            setPRIcon('eye-slash');
            setPRCh(false);
        }else{
            setPRIcon('check');
            setPRCh(true);
        }
    }
    const SAIconCH = () => {
        if(SAIcon == 'check'){
            setSAIcon('eye-slash');
            setSACh(false);
        }else{
            setSAIcon('check');
            setSACh(true);
        }
    }
    const VSIconCH = () => {
        if(VSIcon == 'check'){
            setVSIcon('eye-slash');
            setVSCh(false);
        }else{
            setVSIcon('check');
            setVSCh(true);
        }
    }
    const SPIconCH = () => {
        if(SPIcon == 'check'){
            setSPIcon('eye-slash');
            setSPCh(false);
        }else{
            setSPIcon('check');
            setSPCh(true);
        }
    }

    return <div class="AllContainer">
        <div class="containerFilter">
            <div class="col-8 titulo">
                <h1>Busqueda</h1>
            </div>
            <button class="col-10  generalFilter" onClick={()=>{GeneralCH()}}>
                <div class="col-3">
                    <CDBIcon icon={GIcon}></CDBIcon>
                </div>
                <div class="col-10 filterText">
                    <p>General</p>
                </div>
            </button >
            {/* ADD A FOR EACH FOR EXAMS */}
            <button class="col-10 MMSEFilter examsFilter" onClick ={()=>{IconCH()}}>
                <div class="col-3">
                    <CDBIcon icon={MIcon}></CDBIcon>
                </div>
                <div class="col-10 filterText">
                    <p>Prueba MMSE</p>
                </div>
            </button>
            <button class="col-10 CFSFilter examsFilter" onClick ={()=>{CFIconCH()}}>
                <div class="col-3">
                    <CDBIcon icon={CFIcon}></CDBIcon>
                </div>
                <div class="col-10 filterText">
                    <p>CFS</p>
                </div>
            </button>
            <button class="col-10 KATZFilter examsFilter" onClick ={()=>{KAIconCH()}}>
                <div class="col-3">
                    <CDBIcon icon={KAIcon}></CDBIcon>
                </div>
                <div class="col-10 filterText">
                    <p>KATZ</p>
                </div>
            </button>
            <button class="col-10 ADGYFilter examsFilter" onClick ={()=>{ADIconCH()}}>
                <div class="col-3">
                    <CDBIcon icon={ADIcon}></CDBIcon>
                </div>
                <div class="col-10 filterText">
                    <p>ADGY</p>
                </div>
            </button>
            <button class="col-10 PRFilter examsFilter" onClick ={()=>{PRIconCH()}}>
                <div class="col-3">
                    <CDBIcon icon={PRIcon}></CDBIcon>
                </div>
                <div class="col-10 filterText">
                    <p>PR</p>
                </div>
            </button>
            <button class="col-10 SARCFFilter examsFilter" onClick ={()=>{SAIconCH()}}>
                <div class="col-3">
                    <CDBIcon icon={SAIcon}></CDBIcon>
                </div>
                <div class="col-10 filterText">
                    <p>SARCF</p>
                </div>
            </button>
            <button class="col-10 VSGFilter examsFilter" onClick ={()=>{VSIconCH()}}>
                <div class="col-3">
                    <CDBIcon icon={VSIcon}></CDBIcon>
                </div>
                <div class="col-10 filterText">
                    <p>VSG</p>
                </div>
            </button>
            <button class="col-10 SPPBFilter examsFilter" onClick ={()=>{SPIconCH()}}>
                <div class="col-3">
                    <CDBIcon icon={SPIcon}></CDBIcon>
                </div>
                <div class="col-10 filterText">
                    <p>SPPB</p>
                </div>
            </button>
        </div>
        <div class="containerTable">
            <table id="myTable" class="myTable">
                <tr class="col-2 headers">
                    <th>Nombre</th>
                    <th>Parroquia</th>
                    <th>Decano</th>
                    <th>Ciudad</th>
                    <th>Edad</th>
                </tr>
                {UserData.filter(person => (person.MMSE==true&&MMCH==true)||(person.CFS==true&&CFCH==true)||(person.KATZ==true&&KACH==true)||(person.ADGY==true&&ADCH==true)||(person.PR==true&&PRCH==true)||(person.SARCF==true&&SACH==true)||(person.VSG==true&&VSCH==true)||(person.SPPB==true&&SPCH==true)).map((item,i)=>{
                    return (<tr key={i} class="col-10 userInfo">
                    <td><a href="/dashboardProfile">{item.Nombre}</a></td>
                    <td><a href="/dashboardProfile">{item.Parroquia}</a></td>
                    <td><a href="/dashboardProfile">{item.Decano}</a></td>
                    <td><a href="/dashboardProfile">{item.Zona}</a></td>
                    <td><a href="/dashboardProfile">{item.Edad}</a></td>
                    </tr>)
                })}
            </table>
        </div>
    </div>
}

export default UserTable; 