function sendCurrentState(event, state, toy_id) {
  $.ajax({
    url: '/event_switch',
    method: 'POST',
    datatype: 'json',
    data:{
      event: event,
      state: state,
      id: toy_id,
    },
    error:function(){
      console.log('Something wrong!')
    }
  });
}