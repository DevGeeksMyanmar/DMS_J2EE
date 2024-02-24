let selectedItems = [];

	const updateSelectedItems = (itemId,isSelected)=>{
		if(isSelected && itemId !== undefined){
			selectedItems.push(itemId);
		}else{
			const index = selectedItems.indexOf(itemId);
			if(index > -1){
				selectedItems.splice(index,1);
			}
		}
		
	}
	   document.querySelectorAll('.order-checkbox').forEach(checkbox => {
	        checkbox.addEventListener("change", (e) => {
	            const orderId = e.target.dataset.orderId;
	            const isSelected = e.target.checked;
	            updateSelectedItems(orderId, isSelected);
                
	        });
	    })	    
	    
	    document.getElementById("checkbox-all-search").addEventListener("change", (e)=> {
        const checkboxes = document.querySelectorAll('.order-checkbox'); 
        const isSelectedAll = e.target.checked; 

        checkboxes.forEach(checkbox => {
            checkbox.checked = isSelectedAll; 
            const orderId = checkbox.dataset.orderId;
            updateSelectedItems(orderId, isSelectedAll); 

   });
});
let driverId;
document.addEventListener('DOMContentLoaded',() =>{
	const driverElement = document.getElementById('driver');
	
	driverElement.addEventListener('change',(e)=>{
		driverId = e.target.value;
		
	})
	
})

const btn_submit = document.querySelector("#btn-submit");

btn_submit.addEventListener("click",()=> {
	
      sendDataToServlet(driverId,selectedItems.slice());//send data to servlet

	selectedItems.length = 0;
})

function sendDataToServlet(driverId,selectedItems) {
    
    // Define the data you want to send
    var dataToSend = {
        driverId: driverId,
        selectedItems: selectedItems
    };

    // Convert the data to JSON format
    var jsonData = JSON.stringify(dataToSend);
	
    // Define the fetch options
    var fetchOptions = {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: jsonData
    };

    // Make the fetch request
    fetch('home', fetchOptions)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text(); // Assuming you're expecting a text response
        })
        .then(data => {
            if(data == "ordered"){
                swal("Success","Order assigned to driver successfully","success")
                .then((result) => {
                    const baseUrl = window.location.protocol + "//" + window.location.host;
                    const newPath = "/DMS/views/admin/home";
                    window.location.href = baseUrl + newPath;
                  });
              
             
            }else if(data == "fail"){
              swal("Sorry","Assigned fail.","error");
             
            }
        })
        .catch(error => {
            console.error('There was a problem with your fetch operation:', error);
        });
}