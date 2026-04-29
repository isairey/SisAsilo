import{CDBSidebar,CDBSidebarContent,
    CDBSidebarFooter,CDBSidebarHeader,CDBSidebarMenu,CDBSidebarMenuItem,} from 'cdbreact';
import {React} from 'react';
import { NavLink } from 'react-router-dom';
import Logo from '../assets/Logo.png';
import './sidebar.css';

const Sidebar = () => {
    return <div style={{height: '100vh'}}>
        <CDBSidebar textColor="#333" backgroundColor="#7FB9C1">
        <CDBSidebarHeader prefix={<i className="fa fa-bars" />}>
          <div className="container" style={{alignItems: 'center' }}>
            <img src={Logo} style={{ width: '100px' }}/>
          </div>
        </CDBSidebarHeader>
        <CDBSidebarContent>
          <CDBSidebarMenu>
            <NavLink exact to="/dashboardTable" class="Busqueda" activeClassName="activeClicked">
              <CDBSidebarMenuItem class="CDBSidebarMenuItem" icon="search"><span>Busqueda</span></CDBSidebarMenuItem>
            </NavLink>
          </CDBSidebarMenu>
        </CDBSidebarContent>
      </CDBSidebar>
    </div>
}

export default Sidebar;
