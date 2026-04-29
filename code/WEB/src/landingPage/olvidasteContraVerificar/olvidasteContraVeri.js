import {React, useState} from 'react';
import Logo from '../../assets/Logo.png';
import './olvidasteContraVeri.css';
import Swal from 'sweetalert2'
import withReactContent from 'sweetalert2-react-content'

const OlvidasteContraVeri = () => {
    const [codigo, setCodigo] = useState('');
    const MySwal = withReactContent(Swal);

    const verificarCodigo = (code) =>{
        // e.preventDefault();
        // console.log('was pressed',usr,' ',pwd);
        if(code == 'Passw0rd'){
            MySwal.fire({
                icon: 'success',
                showConfirmButton:true,
                confirmButtonText: '<a href="/nuevaContra">Continuar</a>',
                allowOutsideClick:false,
                confirmButtonColor:'lime',
                customClass:{
                    confirmButton:'order-2'
                },                                                     
              })
        }else{
            MySwal.fire({
                title: <strong>Codigo Incorrecto</strong>,
                icon: 'error',
                confirmButtonText: 'Regresar',
                customClass:{
                    confirmButton:'order-2'
                }
              })
        }
    }

    const handleChange = event => {
        setCodigo(event.target.value);
      };

    return <div class="LD" style={{ display: 'flex', height: '100vh'}}>
        <div class="col-6 left">
            <p>Bienvenido</p>
            <h1>Abuelitos Abp</h1>
            <img src={Logo} class="imgLogo"></img>
        </div>
        <div class="col-6 right">
            <div class="rightContainer3">
                <h1>Abuelitos Abm</h1>
                <input type="Username" class="form-control userInput" onChange={handleChange} placeholder='Codigo'></input>
                <button class="verificar" onClick ={()=>{verificarCodigo(codigo)}}>Verificar</button>
            </div>
        </div>
    </div>
}

export default OlvidasteContraVeri; 