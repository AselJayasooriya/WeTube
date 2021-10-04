function enableInquirySend(){
    if(document.getElementById("iCheck").checked){
        document.getElementById("iBtn").disabled=false;
    }
    else{
        document.getElementById("iBtn").disabled=true;
    }
}

