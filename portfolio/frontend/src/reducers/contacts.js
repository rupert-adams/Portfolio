import { ADD_CONTACT } from "../actions/types.js";

const initialState = {
    contacts: []
}

export default function(state=initialState, action) {
    switch(action.type) {
        case ADD_CONTACT:
            return {
                ...state,
                contacts: [...state.contacts, action.payload]
            };
        default:
            return state;
    }
};