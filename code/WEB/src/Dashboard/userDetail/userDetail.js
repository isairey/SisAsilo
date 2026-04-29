import {React, useState} from 'react';
import './userDetail.css';
import OldMan from '../../assets/oldMan.png';
import { CDBBtn, CDBIcon } from 'cdbreact';
import Swal from 'sweetalert2';
import withReactContent from 'sweetalert2-react-content';
import * as XLSX from 'xlsx';
import {saveAs} from 'file-saver';


const UserDetail = () => {
    const [MMSE, setMMSE] = useState(25);
    const [MMSEBG, setMBG] = useState('#60d479');
    const [SarcF, setSarcF] = useState(3);
    const [SarcBG, setSABG] = useState('#60d479');
    const [CFS, setCFS] = useState(2);
    const [CFBG, setCFBG] = useState('60d479');
    const [KATZ, setKATZ] = useState(4);
    const [KABG, setKABG] = useState('#f8fb58');
    const [LWB, setLWB] = useState(1);
    const [LWBG, setLWBG] = useState('#f47072');
    const [ADGY, setADGY] = useState(3);
    const [ADBG, setADBG] = useState('#60d479');
    const [PR, setPR] = useState(12);
    const [PRBG, setPRBG] = useState('#f8fb58');
    const [VSG, setVSG] = useState(8);
    const [VSBG, setVSBG] = useState('#f8fb58');
    const [SPPB, setSPPB] = useState(10);
    const [SPBG, setSPBG] = useState('#60d479');

    const [nombre, setNombre] = useState('Juan Sebastian Blando');
    const [parroquia, setParroquia] = useState('San Juan');
    const [decano, setDecano] = useState('Decano1');
    const [zona, setZona] = useState('Monterrey');

    const MySwal = withReactContent(Swal);
    var pruebas = ['MMSE','SarcF','CFS','KATZ','LWB','ADGY','PR','VSG','SPPB'];
    var pruebaSet = [setMMSE,setSarcF,setCFS,setKATZ,setLWB,setADGY,setPR,setVSG,setSPPB];
    var pruebasBG = [setMBG,setSABG,setCFBG,setKABG,setLWBG,setADBG,setPRBG,setVSBG,setSPBG];

    const showInfo = (examen) => {
        var desc = "";
        if(examen=='MMSE'){
            if(MMSE <= 5 && MMSE >= 0){
                desc = "Deterioro cognitivo severo";
            }else if(MMSE <= 9 && MMSE >= 6){
                desc = "Existe un deterioro cognitivo de moderado a severo"
            }else if(MMSE <= 24 && MMSE >= 10){
                desc = "Existe un deterioro cognitivo de leve a moderado"
            }else if(MMSE <= 26 && MMSE >= 25){
                desc = "Pudiera existir un posible deterioro cognitivo"
            }else if(MMSE <= 30 && MMSE >= 27){
                desc = "No existe deterioro cognitivo"
            }
            MySwal.fire({
                title: 'Mini Mental State Examination de Folstein (MMSE-30)',
                html:<i>{desc}</i>,
                showConfirmButton:false
              })
        }
        if(examen=='SarcF'){
            if(SarcF < 4){
                desc="Normal"
            }else if(SarcF >= 4 && SarcF <= 10){
                desc="Sarcopenia"
            }
            MySwal.fire({
                title: 'Escala Sarc-F',
                html:<i>{desc}</i>,
                showConfirmButton:false
              })
        }
        if(examen=='CFS'){
            if(CFS == 1){
                desc="Muy en Forma"
            }else if(CFS == 2){
                desc="En forma"
            }else if(CFS == 3){
                desc="Bien"
            }else if(CFS == 4){
                desc="Viviendo con una leve fragilidad"
            }else if(CFS == 5){
                desc="Viviendo con fragilidad"
            }else if(CFS == 6){
                desc="Viviendo con fragilidad moderada"
            }else if(CFS == 7){
                desc="Viviendo con fragilidad severa"
            }else if(CFS == 8){
                desc="Viviendo con fragilidad muy severa"
            }else if(CFS == 9){
                desc="Enfermedad terminal"
            }
            MySwal.fire({
                title: 'Clinical Fraility Scale',
                html:<i>{desc}</i>,
                showConfirmButton:false
              })
        }
        if(examen=='KATZ'){
            if(KATZ == 0){
                desc="Dependencia total"
            }else if(KATZ >= 1 && KATZ <= 5){
                desc="Dependencia"
            }else if(KATZ >= 6){
                desc="Independencia"
            }
            MySwal.fire({
                title: 'Índice de Katz',
                html:<i>{desc}</i>,
                showConfirmButton:false
              })
        }
        if(examen=='LWB'){
            if(LWB >= 0 && LWB <= 1){
                desc="Dependencia total"
            }else if(LWB >= 2 && LWB <= 3){
                desc="Dependencia grave"
            }else if(LWB >= 4 && LWB <= 5){
                desc="Dependencia moderada"
            }else if(LWB >= 6 && LWB <= 7){
                desc="Dependencia ligera"
            }else if(LWB >= 8){
                desc="Autonomia"
            }
            MySwal.fire({
                title: 'Índice de Lawton & Brody ',
                html:<i>{desc}</i>,
                showConfirmButton:false
              })
        }
        if(examen=='ADGY'){
            if(ADGY >= 0 && ADGY <= 5){
                desc="Normal"
            }else if(ADGY >= 6 && ADGY <= 9){
                desc="Depresion Leve"
            }else if(ADGY >= 10){
                desc="Depresion Establecida"
            }
            MySwal.fire({
                title: 'Escala Abreviada de Depresión Geriátrica de Yesavage',
                html:<i>{desc}</i>,
                showConfirmButton:false
              })
        }
        if(examen=='PR'){
            if(PR >= 0 && PR <= 10){
                desc="Normal"
            }else if(PR >= 11 && PR <= 20){
                desc="Riesgo Leve"
            }else if(PR > 20){
                desc="Riesgo Alto  "
            }
            MySwal.fire({
                title: 'Prueba de reloj',
                html:<i>{desc}</i>,
                showConfirmButton:false
              })
        }
        if(examen=='VSG'){
            if(VSG >= 0 && VSG <= 7){
                desc="Bajo Riesgo"
            }else if(VSG >= 8 && VSG <= 9){
                desc="Riesgo Medio"
            }else if(VSG >= 10){
                desc="Riesgo Alto  "
            }
            MySwal.fire({
                title: 'Escala de valoración sociofamiliar de Gijón',
                html:<i>{desc}</i>,
                showConfirmButton:false
              })
        }
        if(examen=='SPPB'){
            if(SPPB >= 0 && SPPB <= 7){
                desc="Desempeno fisico bajo"
            }else if(SPPB >= 8 && SPPB <= 10){
                desc="Buen desempeno fisico"
            }
            MySwal.fire({
                title: 'Short Physical Performance Battery (Sppb)',
                html:<i>{desc}</i>,
                showConfirmButton:false
              })
        }
    }

    const fileHandler = (file) =>{
        const promise=new Promise((resolve,reject)=>{
            const fileReader = new FileReader();
            fileReader.readAsArrayBuffer(file)
            
            fileReader.onload = (e) =>{
                const bufferArray = e.target.result;
                const wb = XLSX.read(bufferArray,{type:'buffer'});
                const wsname = wb.SheetNames[0];
                const ws = wb.Sheets[wsname];
                const data = XLSX.utils.sheet_to_json(ws);
                resolve(data);
            };

            fileReader.onerror = (error) => {
                reject(error);
            }
        });

        promise.then((d)=>{
            console.log(d);
            setNombre(d[0].Nombre);
            setParroquia(d[0].Parroquia);
            setDecano(d[0].Decano);
            setZona(d[0].Zona);
            var idx = pruebas.indexOf('MMSE');
            
            if(idx != -1){
                pruebaSet[idx](d[0].MMSE);
                if(d[0].MMSE <= 9 && d[0].MMSE >= 0){
                    pruebasBG[idx]('#f47072');
                }else if(d[0].MMSE >= 10 && d[0].MMSE <= 24){
                    pruebasBG[idx]('#f8fb58');
                }else if(d[0].MMSE >= 25){
                    pruebasBG[idx]('#60d479');
                }
            }
            idx = pruebas.indexOf('SarcF');
            if(idx != -1){
                pruebaSet[idx](d[0].SarcF);
                if(d[0].SarcF >= 10){
                    pruebasBG[idx]('#f47072');
                }else if(d[0].SarcF >= 5 && d[0].SarcF <= 9){
                    pruebasBG[idx]('#f8fb58');
                }else if(d[0].SarcF >= 0 && d[0].SarcF <= 4){
                    pruebasBG[idx]('#60d479');
                }
            }
            idx = pruebas.indexOf('CFS');
            if(idx != -1){
                pruebaSet[idx](d[0].CFS);
                if(d[0].CFS >= 7){
                    pruebasBG[idx]('#f47072');
                }else if(d[0].CFS >= 4 && d[0].CFS <= 6){
                    pruebasBG[idx]('#f8fb58');
                }else if(d[0].CFS <= 3){
                    pruebasBG[idx]('#60d479');
                }
            }
            idx = pruebas.indexOf('KATZ');
            if(idx != -1){
                pruebaSet[idx](d[0].KATZ);
                if(d[0].KATZ == 0){
                    pruebasBG[idx]('#f47072');
                }else if(d[0].KATZ >= 1 && d[0].KATZ <= 5){
                    pruebasBG[idx]('#f8fb58');
                }else if(d[0].KATZ >= 6){
                    pruebasBG[idx]('#60d479');
                }
            }
            idx = pruebas.indexOf('LWB');
            if(idx != -1){
                pruebaSet[idx](d[0].LWB );
                if(d[0].LWB <= 3 && d[0].LWB >= 0){
                    pruebasBG[idx]('#f47072');
                }else if(d[0].LWB >= 4 && d[0].LWB <= 5){
                    pruebasBG[idx]('#f8fb58');
                }else if(d[0].LWB >= 6){
                    pruebasBG[idx]('#60d479');
                }
            }
            idx = pruebas.indexOf('ADGY');
            if(idx != -1){
                pruebaSet[idx](d[0].ADGY);
                if(d[0].ADGY >= 10){
                    pruebasBG[idx]('#f47072');
                }else if(d[0].ADGY >= 6 && d[0].ADGY <= 9){
                    pruebasBG[idx]('#f8fb58');
                }else if(d[0].ADGY <= 5 && d[0].ADGY >= 0){
                    pruebasBG[idx]('#60d479');
                }
            }
            idx = pruebas.indexOf('PR');
            if(idx != -1){
                pruebaSet[idx](d[0].PR);
                if(d[0].PR >= 20){
                    pruebasBG[idx]('#f47072');
                }else if(d[0].PR >= 11 && d[0].PR < 20){
                    pruebasBG[idx]('#f8fb58');
                }else if(d[0].PR <= 10){
                    pruebasBG[idx]('#60d479');
                }
            }
            idx = pruebas.indexOf('VSG');
            if(idx != -1){
                pruebaSet[idx](d[0].VSG);
                if(d[0].VSG >= 10){
                    pruebasBG[idx]('#f47072');
                }else if(d[0].VSG >= 8 && d[0].VSG <= 9){
                    pruebasBG[idx]('#f8fb58');
                }else if(d[0].VSG <= 7){
                    pruebasBG[idx]('#60d479');
                }
            }
            idx = pruebas.indexOf('SPPB');
            if(idx != -1){
                pruebaSet[idx](d[0].SPPB);
                if(d[0].SPPB <= 7){
                    pruebasBG[idx]('#f47072');
                }else if(d[0].SPPB >= 8){
                    pruebasBG[idx]('#60d479');
                }
            }
        })
    };


    const update = (examen) =>{
        MySwal.fire({
            title: 'Entrar Valor',
            html: `<input type="text" id="valor" class="swal2-input" placeholder=" ">`,
            confirmButtonText: 'Confirmar',
            confirmButtonColor:'green',
            customClass:{
                confirmButton:'order-2',
            },
            preConfirm: () => {
              const valor = MySwal.getPopup().querySelector('#valor').value
              if (!valor) {
                MySwal.showValidationMessage(`Porfavor ingresar valor`)
              }
              return { valor: valor }
            }
          }).then((result) => {
            var idx = pruebas.indexOf(examen);
            if(idx != -1 && examen=='MMSE'){
                pruebaSet[idx](result.value.valor);
                if(result.value.valor <= 9 && result.value.valor >= 0){
                    pruebasBG[idx]('#f47072');
                }else if(result.value.valor >= 10 && result.value.valor <= 24){
                    pruebasBG[idx]('#f8fb58');
                }else if(result.value.valor >= 25){
                    pruebasBG[idx]('#60d479');
                }
            }
            if(idx != -1  && examen=="SarcF"){
                pruebaSet[idx](result.value.valor);
                if(result.value.valor >= 10){
                    pruebasBG[idx]('#f47072');
                }else if(result.value.valor >= 5 && result.value.valor <= 9){
                    pruebasBG[idx]('#f8fb58');
                }else if(result.value.valor >= 0 && result.value.valor <= 4){
                    pruebasBG[idx]('#60d479');
                }
            }
            if(idx != -1  && examen=='CFS'){
                pruebaSet[idx](result.value.valor);
                if(result.value.valor >= 7){
                    pruebasBG[idx]('#f47072');
                }else if(result.value.valor >= 4 && result.value.valor <= 6){
                    pruebasBG[idx]('#f8fb58');
                }else if(result.value.valor <= 3){
                    pruebasBG[idx]('#60d479');
                }
            }
            if(idx != -1 && examen=='KATZ'){
                pruebaSet[idx](result.value.valor);
                if(result.value.valor == 0){
                    pruebasBG[idx]('#f47072');
                }else if(result.value.valor >= 1 && result.value.valor <= 5){
                    pruebasBG[idx]('#f8fb58');
                }else if(result.value.valor >= 6){
                    pruebasBG[idx]('#60d479');
                }
            }
            if(idx != -1 && examen=='LWB'){
                pruebaSet[idx](result.value.valor );
                if(result.value.valor <= 3 && result.value.valor >= 0){
                    pruebasBG[idx]('#f47072');
                }else if(result.value.valor >= 4 && result.value.valor <= 5){
                    pruebasBG[idx]('#f8fb58');
                }else if(result.value.valor >= 6){
                    pruebasBG[idx]('#60d479');
                }
            }
            if(idx != -1 && examen=='ADGY'){
                pruebaSet[idx](result.value.valor);
                if(result.value.valor >= 10){
                    pruebasBG[idx]('#f47072');
                }else if(result.value.valor >= 6 && result.value.valor <= 9){
                    pruebasBG[idx]('#f8fb58');
                }else if(result.value.valor <= 5 && result.value.valor >= 0){
                    pruebasBG[idx]('#60d479');
                }
            }
            if(idx != -1 && examen=='PR'){
                pruebaSet[idx](result.value.valor);
                if(result.value.valor >= 20){
                    pruebasBG[idx]('#f47072');
                }else if(result.value.valor >= 11 && result.value.valor < 20){
                    pruebasBG[idx]('#f8fb58');
                }else if(result.value.valor <= 10){
                    pruebasBG[idx]('#60d479');
                }
            }
            if(idx != -1 && examen=='VSG'){
                pruebaSet[idx](result.value.valor);
                if(result.value.valor >= 10){
                    pruebasBG[idx]('#f47072');
                }else if(result.value.valor >= 8 && result.value.valor <= 9){
                    pruebasBG[idx]('#f8fb58');
                }else if(result.value.valor <= 7){
                    pruebasBG[idx]('#60d479');
                }
            }
            if(idx != -1 && examen=='SPPB'){
                pruebaSet[idx](result.value.valor);
                if(result.value.valor <= 7){
                    pruebasBG[idx]('#f47072');
                }else if(result.value.valor >= 8){
                    pruebasBG[idx]('#60d479');
                }
            }
          })
    }

    const descargarExcel = () =>{
        var wb = XLSX.utils.book_new();
        wb.Props = {
            Title:"Datos_Paciente",
            Subject:"datosInformaticos",
            Author:"Abp",
            CreatedDate: new Date()
        };
        wb.SheetNames.push("Datos Paciente");
        var ws_data = [["Nombre","Parroquia","Decano","Zona","MMSE","SarcF","CFS","KATZ","LWB","ADGY","PR","VSG","SPPB"],[nombre,parroquia,decano,zona,MMSE,SarcF,CFS,KATZ,LWB,ADGY,PR,VSG,SPPB]];
        var ws = XLSX.utils.aoa_to_sheet(ws_data);
        wb.Sheets["Datos Paciente"] = ws;

        var wbout = XLSX.write(wb, {bookType:'xlsx',type:'binary'});
        function s2ab(s){
            var buf = new ArrayBuffer(s.length);
            var view = new Uint8Array(buf);
            for(var i = 0 ; i < s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
            return buf;
        }
        saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}),'datosPaciente.xlsx')
    }
    
    return <div class="containerDetail">
        <div class="row topRow">
            <div class="col-6 userBanner">
                <h1>Juan Sebastian Blando</h1>
                <img class="userimg" src={OldMan}/>
            </div>
            <div class="col-8 zonedetails">
                <div class="generalInfo">
                    <h1 class="Resultados">Resultados:</h1>
                    {/* <button class="generalExcel CHINGADAMARCELO" > */}
                    <label class="generalExcel subirBoton">
                        <input type="file" onChange={(e)=>{const file = e.target.files[0]; fileHandler(file);}}></input>
                        Subir
                    </label>
                    {/* </button> */}
                    <button className='descargarBoton' id="downloadExcel" onClick={descargarExcel}>Descargar</button> 
                    <i class="fa fa-clipboard"></i>
                </div>
                <div class="generalInfo">
                    <div class="col-3">
                        <h1>Parroquia:</h1>
                    </div>
                    <div class="col-9">
                        <h1>{parroquia}</h1>
                    </div>
                </div>
                <div class="generalInfo">
                <div class="col-3">
                        <h1>Decano:</h1>
                    </div>
                    <div class="col-9">
                        <h1>{decano}</h1>
                    </div>
                </div>
                <div class="generalInfo">
                <div class="col-3">
                        <h1>Zona:</h1>
                    </div>
                    <div class="col-9">
                        <h1>{zona}</h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="row botRow">
            <div class="col-6 MSSE generalExam" style={{backgroundColor: MMSEBG }}>
                <span class="INFO"><CDBIcon icon="info" onClick ={()=>{showInfo('MMSE')}}/></span>
                <h1>MMSE:</h1>
                {/* <input type="MMSE" id="MMSE" name="MMSE" onChange={handleMMSE} placeholder={MMSE}></input> */}
                <h1>{MMSE}</h1>
                <CDBBtn color="warning" size="large" onClick ={()=>{update('MMSE')}}>
                    <CDBIcon icon="pen-nib"/>
                    editar
                </CDBBtn>
            </div>
            <div class="col-6 SARCF generalExam" style={{backgroundColor: SarcBG }}>
                <span class="INFO"><CDBIcon icon="info" onClick ={()=>{showInfo('SarcF')}}/></span>
                <h1>Sarc F:</h1>
                {/* <input type="text" id="Sarc F" placeholder={SarcF}/> */}
                <h1>{SarcF}</h1>
                <CDBBtn color="warning" size="large" onClick ={()=>{update('SarcF')}}>
                    <CDBIcon icon="pen-nib"/>
                    editar
                </CDBBtn>
            </div>
            <div class="col-6 CFS generalExam" style={{backgroundColor: CFBG }}>
                <span class="INFO"><CDBIcon icon="info" onClick ={()=>{showInfo('CFS')}}/></span>
                <h1>CFS:</h1>
                {/* <input type="text" id="CFS" placeholder={CFS}/> */}
                <h1>{CFS}</h1>
                <CDBBtn color="warning" size="large" onClick ={()=>{update('CFS')}}>
                    <CDBIcon icon="pen-nib"/>
                    editar
                </CDBBtn>
            </div>
            <div class="col-6 KATZ generalExam" style={{backgroundColor: KABG }}>
                <span class="INFO"><CDBIcon icon="info" onClick ={()=>{showInfo('KATZ')}}/></span>
                <h1>KATZ:</h1>
                {/* <input type="text" id="KATZ" placeholder={KATZ}/> */}
                <h1>{KATZ}</h1>
                <CDBBtn color="warning" size="large" onClick ={()=>{update('KATZ')}}>
                    <CDBIcon icon="pen-nib"/>
                    editar
                </CDBBtn>
            </div>
            <div class="col-6 LWB generalExam" style={{backgroundColor: LWBG }}>
                <span class="INFO"><CDBIcon icon="info" onClick ={()=>{showInfo('LWB')}}/></span>
                <h1>LW&B:</h1>
                {/* <input type="text" id="LWB" placeholder={LWB}/> */}
                <h1>{LWB}</h1>
                <CDBBtn color="warning" size="large" onClick ={()=>{update('LWB')}}>
                    <CDBIcon icon="pen-nib"/>
                    editar
                </CDBBtn>
            </div>
            <div class="col-6 ADGY generalExam" style={{backgroundColor: ADBG }}>
                <span class="INFO"><CDBIcon icon="info" onClick ={()=>{showInfo('ADGY')}}/></span>
                <h1>ADGY:</h1>
                {/* <input type="text" id="ADGY" placeholder={ADGY}/> */}
                <h1>{ADGY}</h1>
                <CDBBtn color="warning" size="large" onClick ={()=>{update('ADGY')}}>
                    <CDBIcon icon="pen-nib"/>
                    editar
                </CDBBtn>
            </div>
            <div class="col-6 PR generalExam" style={{backgroundColor: PRBG }}>
                <span class="INFO"><CDBIcon icon="info" onClick ={()=>{showInfo('PR')}}/></span>
                <h1>PR:</h1>
                {/* <input type="text" id="PR" placeholder={PR}/> */}
                <h1>{PR}</h1>
                <CDBBtn color="warning" size="large" onClick ={()=>{update('PR')}}>
                    <CDBIcon icon="pen-nib"/>
                    editar
                </CDBBtn>
            </div>
            <div class="col-6 VSG generalExam" style={{backgroundColor: VSBG }}>
                <span class="INFO"><CDBIcon icon="info" onClick ={()=>{showInfo('VSG')}}/></span>
                <h1>VSG:</h1>
                {/* <input type="text" id="VSG" placeholder={VSG}/> */}
                <h1>{VSG}</h1>
                <CDBBtn color="warning" size="large" onClick ={()=>{update('VSG')}}>
                    <CDBIcon icon="pen-nib"/>
                    editar
                </CDBBtn>
            </div>
            <div class="col-6 SPPB generalExam" style={{backgroundColor: SPBG }}>
                <span class="INFO"><CDBIcon icon="info" onClick ={()=>{showInfo('SPPB')}}/></span>
                <h1>SPPB:</h1>
                {/* <input type="text" id="SPPB" placeholder={SPPB}/> */}
                <h1>{SPPB}</h1>
                <CDBBtn color="warning" size="large" onClick ={()=>{update('SPPB')}}>
                    <CDBIcon icon="pen-nib"/>
                    editar
                </CDBBtn>
            </div>
        </div>
    </div>
}

export default UserDetail; 