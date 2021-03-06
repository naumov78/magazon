import * as APIUtil from '../api/session.api';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";


export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});

export function signup(user){
  return (dispatch) => {
    return APIUtil.signup(user).then(
      (currentUser) => dispatch(receiveCurrentUser(currentUser)),
      (errors) => dispatch(receiveErrors(errors))
    );
  }
}

export function signin(user){
  return (dispatch) => {
    return APIUtil.signin(user).then(
      (currentUser) => dispatch(receiveCurrentUser(currentUser)),
      (errors) => dispatch(receiveErrors(errors))
    );
  }
}

export function logout(){
  return (dispatch) => {
    return APIUtil.logout().then(
      (currentUser) => dispatch(receiveCurrentUser(null)),
      (errors) => dispatch(receiveErrors(errors))
    );
  }
}

export const refreshCurrentUser = () => {
  return (dispatch) => {
    return APIUtil.refreshCurrentUser().then((user) => {
      return dispatch(receiveCurrentUser(user));
    });
  }
}
