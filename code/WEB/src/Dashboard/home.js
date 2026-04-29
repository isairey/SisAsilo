import {React} from 'react';
import Sidebar from '../sidebar/sidebar';
import Filter from './filter/filter';
import './home.css';
import UserDetail from './userDetail/userDetail';
import UserTable from './userTable/userTable';

const Home = () => {
    return <div class="rowC">
        <Sidebar></Sidebar> 
        {/* FILTER   PLUS USER TABLE WHEN SEARCHING FOR USER */}
        {/* <Filter></Filter> */}
        <div class="userRow">
            <UserTable></UserTable>
        </div>
        {/* <div class="detailRow">
            <UserDetail></UserDetail>
        </div> */}
    </div>
}

export default Home; 