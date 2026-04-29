import {React, useState} from 'react';
import { NavLink } from 'react-router-dom';
import Logo from '../../assets/Logo.png';
import './nuevaContra.css';
import Swal from 'sweetalert2';
import withReactContent from 'sweetalert2-react-content';

const NuevaContra = () => {

    const MySwal = withReactContent(Swal);
    const logined = () =>{
            MySwal.fire({
                title:"Contrasenas no son iguales",
                icon: 'error',
                showConfirmButton:true,
                // confirmButtonText: '<a href="/">Continuar</a>',
                confirmButtonText: 'Regresar',
                allowOutsideClick:true,
                confirmButtonColor:'purple',
                customClass:{
                    confirmButton:'order-2'
                },                                                     
              })
    }

    return <div class="LD" style={{ display: 'flex', height: '100vh'}}>
        <div class="col-6 left">
            <p>Bienvenido</p>
            <h1>Abuelitos Abp</h1>
            <img src={Logo} class="imgLogo"></img>
        </div>
        <div class="col-6 right">
            <div class="rightContainer">
                <h1>Abuelitos Abm</h1>
                <label for="Password" class="userLabel">Nueva Contrasena</label>
                <input type="Password" id="Password" class="form-control userInput" placeholder='Nueva Contrasena'></input>
                
                <label for="Password2" class="contraLabel">Confirmar Contrasena</label>
                <input type="Password" id="Password2" class="form-control userInput" placeholder='Confirmar Contrasena'></input>
                {/* <NavLink exact to="/"> */}
                    <button class="nuevaContra" onClick ={()=>{logined()}}>Crear nueva contrasena</button>
                {/* </NavLink> */}
            </div>
        </div>
    </div>
}

export default NuevaContra; 