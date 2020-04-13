import { combineReducers } from 'redux';
import projects from './projects';
import contacts from './contacts';

export default combineReducers({
    projects,
    contacts
});