import './bootstrap';

import Alpine from 'alpinejs';

window.Alpine = Alpine;

Alpine.start();
// ########################################### searching for users ####################################################

document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.getElementById('search-input');
    const resultsContainer = document.getElementById('results-container');

    searchInput.addEventListener('input', function () {
        const searchTerm = searchInput.value;

        if (!searchTerm) {
            resultsContainer.innerHTML = '';
            return;
        }

        function searchUsers(searchTerm) {
            const xhr = new XMLHttpRequest(); 
            const url = `/api/search-users?search=${searchTerm}`; 
        
            xhr.open('GET', url, true); 
        
            xhr.setRequestHeader('Content-Type', 'application/json'); 
        
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    // console.log(JSON.parse(xhr.responseText).users)
                    try {
                        const users = JSON.parse(xhr.responseText).users; 
                        const friend_requests = JSON.parse(xhr.responseText).friend_requests; 
                        const friends = JSON.parse(xhr.responseText).friends; 
                        // console.log(friends)
        
                        const resultsContainer = document.getElementById('results-container'); 
                        resultsContainer.innerHTML = ''; 

                        function contains(array, value) {
                            return array.some(item => item === value);
                        }
        
                        if (users.length > 0) {

                            users.forEach(function (user) {

                                if(!contains(friends,user.id)){

                                    if(contains(friend_requests,user.id)){
            
                                        var listProfiles = `
                                        <div class="px-2 row g-0 my-3 al-i-c">
                                        <div class="col-2 row j-c-c g-0">
                                        <img src=http://127.0.0.1:8000/storage/${user.profile_picture}" alt="" class="profile-img-creatPost">
                                        </div>
                                        <p class="mb-0 col-6 text-start f-bold">${user.name}</p>
                                        <p class="bg-color-2 px-2 mb-0 text-center col-4 text-light f-bold border border-0 b-round-4">Request already sent</p>
                                        </div>
                                        `
    
                                    }else{
    
                                        var listProfiles = `
                                        <div class="px-2 row g-0 my-3 al-i-c">
                                        <div class="col-2 row j-c-c g-0">
                                        <img src="http://127.0.0.1:8000/storage/${user.profile_picture}" alt="" class="profile-img-creatPost">
                                        </div>
                                        <p class="mb-0 col-6 text-start f-bold">${user.name}</p>
                                        <button class="bg-color-2 px-2 py-2 mb-0 col-4 text-light f-bold border border-0 b-round-4 sendFreindRequestButton" id="${user.id}">
                                        Send Freind Request
                                        </button>
                                        </div>
                                        `
    
                                    }
                                    resultsContainer.innerHTML += listProfiles;
                                    
                                }
                            });
                        } else {

                            resultsContainer.innerHTML = '<p>No users found.</p>';
                        }
                    } catch (error) {
                        console.error('Error parsing response:', error);
                    }
                } else {
                    console.error('Request failed with status:', xhr.status); 
                }
            };
      
            xhr.onerror = function () {
                console.error('Request failed due to a network error.');
            };
        
            xhr.send(); 
        }
        searchUsers(searchTerm)
    });
});


// ########################################### send freind request ####################################################

document.body.addEventListener('click', function (e) {
    if(e.target && e.target.classList.contains('sendFreindRequestButton')){

        console.log(document.querySelector('meta[name="csrf-token"]').content)
        let id = e.target.id;

        function SendRequest(id) {
            const xhr = new XMLHttpRequest(); 
            const url = `/api/friend-requests`; 
        
            xhr.open('POST', url, true);
        
            xhr.setRequestHeader('Content-Type', 'application/json'); 
            xhr.setRequestHeader('X-CSRF-TOKEN', document.querySelector('meta[name="csrf-token"]').content);

            
            let data = {
                receiver_id: id, 
            };
            
        
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    try {
                        const response = JSON.parse(xhr.responseText); 
                        const receiver = response.receiver_info
                        const request = response.request_info
                                                                    
                        let elmenetChange= e.target.parentElement
                        e.target.remove()
                        let newChild=`<p class="bg-color-2 px-2 mb-0 text-center col-4 text-light f-bold border border-0 b-round-4">Request already sent</p>`
                        elmenetChange.innerHTML+=newChild
                        
                        const FreindRequestIAlreadySent = document.querySelector(`#FreindRequestIAlreadySent`);

                        FreindRequestIAlreadySent.innerHTML +=`
                        <div class="bg-color-1 border border-0 b-round-4 p-3 mb-4">
                            <div class="row g-0 al-i-c">
                                <div class="col-2">
                                    <img src="https://via.placeholder.com/40" alt="" class="rounded-circle d-inline me-3">
                                </div>
                                <div class="col-10">
                                    <p class="text-light f-bold m-0">${receiver[0].name}</p>
                                    <p class="text-light m-0">Date sent : ${request[0].sent_date_only}</p>
                                </div>
                            </div>
                            <div class="mt-3">
                                <p class="c-p bg-color-2 d-inline mb-0 px-3 py-1 text-light border border-0 b-round-4 deleteFreindRequest" id="" data-request-id="${request[0].id}">Delete my request</p>
                            </div>
                        </div>
                        `;
                        // ################## delete freind request already sent  hidden one ( because i do not have websocket )################

                        let deleteFreindRequestButton = document.querySelectorAll(`.deleteFreindRequest`) || null;

                        deleteFreindRequestButton.forEach(e => {
                            
                            e.onclick=function() {
                                
                                function deleteFreindRequest() {
                            
                                    const xhr = new XMLHttpRequest(); 
                                        const url = `/friend-requests/${e.dataset.requestId}`;
                                    
                                        xhr.open('DELETE', url, true);
                                    
                                        xhr.setRequestHeader('Content-Type', 'application/json'); 
                                        xhr.setRequestHeader('X-CSRF-TOKEN', document.querySelector('meta[name="csrf-token"]').content);

                                        xhr.onload = function () {
                                            if (xhr.status === 200 ) {

                                                try {

                                                const response = JSON.parse(xhr.responseText); // محاولة تحليل الاستجابة كـ JSON

                                                e.parentElement.parentElement.remove();

                                                console.log(response.message)

                                                }

                                                catch{
                                                    console.log(`ERROR 404`)
                                                }
                                            }else if (xhr.status === 404){
                                                e.parentElement.parentElement.remove();
                                            }
                                        }
                                        xhr.send();
                                }
                                deleteFreindRequest();
                                console.log(e.dataset.requestId)    
                            }

                        });

                    } catch (error) {
                        console.error('Error parsing response:', error);
                    }
                } else {
                    console.error('Request failed with status:', xhr.status); 
                }
            };
        
            xhr.onerror = function () {
                console.error('Request failed due to a network error.');
            };
        
            xhr.send(JSON.stringify(data)); 
        }
        SendRequest(id)
    }
    });

//      ############################ delete freind request already sent ##############################

let deleteFreindRequestButton = document.querySelectorAll(`.deleteFreindRequest`) || null;

deleteFreindRequestButton.forEach(e => {
    
    e.onclick=function() {
        
        function deleteFreindRequest() {
    
            const xhr = new XMLHttpRequest(); 
                const url = `/friend-requests/${e.dataset.requestId}`;
            
                xhr.open('DELETE', url, true);
            
                xhr.setRequestHeader('Content-Type', 'application/json'); 
                xhr.setRequestHeader('X-CSRF-TOKEN', document.querySelector('meta[name="csrf-token"]').content);

                xhr.onload = function () {
                    if (xhr.status === 200 ) {

                        try {

                        const response = JSON.parse(xhr.responseText); // محاولة تحليل الاستجابة كـ JSON

                        e.parentElement.parentElement.remove();

                        console.log(response.message)

                        }

                        catch{
                            console.log(`ERROR 404`)
                        }
                    }else if (xhr.status === 404){
                        e.parentElement.parentElement.remove();
                    }
                }
                xhr.send();
        }
        deleteFreindRequest();
    }

});

//      ############################ Accept friend request ##############################

let acceptFreindRequestButton = document.querySelectorAll(`.acceptFriendRequest`) || null;

acceptFreindRequestButton.forEach(e => {
    
    e.onclick=function() {
        
        function acceptFreindRequest() {
    
            const xhr = new XMLHttpRequest(); 
                const url = `/friend-requests/${e.dataset.requestId}`;
            
                xhr.open('PUT', url, true);
            
                xhr.setRequestHeader('Content-Type', 'application/json'); 
                xhr.setRequestHeader('X-CSRF-TOKEN', document.querySelector('meta[name="csrf-token"]').content);

                let data = {
                    action: "accept",
                };
            

                xhr.onload = function () {
                    if (xhr.status === 200 ) {

                        try {

                        const response = JSON.parse(xhr.responseText); // محاولة تحليل الاستجابة كـ JSON
                        e.parentElement.parentElement.remove();
                        console.log(response.message)

                        }

                        catch{
                            console.log(`ERROR 404`)
                        }
                    }
                }
                xhr.send(JSON.stringify(data));
        }
        acceptFreindRequest();
    }

});


//      ############################ Refuse friend request ##############################

let refusetFriendRequestButton = document.querySelectorAll(`.refusetFriendRequest`) || null;

refusetFriendRequestButton.forEach(e => {
    
    e.onclick=function() {
        
        function refusetFriendRequest() {
    
            const xhr = new XMLHttpRequest(); 
            const url = `/friend-requests/remove/${e.dataset.requestId}`;
            
                xhr.open('delete', url, true);
            
                xhr.setRequestHeader('Content-Type', 'application/json'); 
                xhr.setRequestHeader('X-CSRF-TOKEN', document.querySelector('meta[name="csrf-token"]').content);

                xhr.onload = function () {
                    if (xhr.status === 200 ) {

                        try {

                        const response = JSON.parse(xhr.responseText); 

                        e.parentElement.parentElement.remove();

                        console.log(response.message)

                        }

                        catch{
                            console.log(`ERROR 404`)
                        }
                    }
                }
                xhr.send();
        }
        refusetFriendRequest();
        console.log(e.dataset.requestId)    
    }

});
 

//      ############################ Delete friendship ##############################

let endFriendshipButton = document.querySelectorAll(`.endFriendship`) || null;

endFriendshipButton.forEach(e => {
    
    e.onclick=function() {
        
        function endFriendship() {
    
            const xhr = new XMLHttpRequest(); 
            const url = `/friendships/${e.dataset.requestId}`;
            
                xhr.open('delete', url, true);
            
                xhr.setRequestHeader('Content-Type', 'application/json'); 
                xhr.setRequestHeader('X-CSRF-TOKEN', document.querySelector('meta[name="csrf-token"]').content);

                xhr.onload = function () {
                    if (xhr.status === 200 ) {

                        try {

                        const response = JSON.parse(xhr.responseText); // محاولة تحليل الاستجابة كـ JSON
                        e.parentElement.parentElement.remove();
                        console.log(response.message)

                        }

                        catch{
                            console.log(`ERROR 404`)
                        }
                    }
                }
                xhr.send();
        }
        endFriendship();
        // console.log(e.dataset.requestId)    
    }

});

// ################################# change the hieght of textarea for post #################################
document.addEventListener("input", function (event) {
    if (event.target.id === "autoExpand") {
        // event.target.style.height = "24px"; 
        event.target.style.height = event.target.scrollHeight + "px"; // Adjust it to the content.
    }
});

// ################################# show and hide post options #################################

let postOptionsButton=document.querySelectorAll(`#postOptionsButton`) || null ;
let hidePostOptionFunction=false;

postOptionsButton.forEach((e)=>{
    e.onclick=()=>{
        if(!e.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.classList.contains(`d-none`)){
            e.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.classList.add(`d-none`)
            hidePostOptionFunction=false;
        }else{
            e.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.classList.remove(`d-none`)
            setTimeout(() => {
                hidePostOptionFunction=true;
                // console.log(hidePostOptionFunction)
            }, 500);
        }
    }
})

document.onclick=()=>{
    if(hidePostOptionFunction===true){
        let postOptions= document.querySelectorAll(`#postOptions`)
        if(event.target.id !== "postOptions" && event.target.parentElement.id !== "postOptions" && event.target.parentElement.parentElement.id !== "postOptions"){
            postOptions.forEach((e)=>{
                if(!e.classList.contains(`d-none`)){
                    e.classList.add(`d-none`)
                    hidePostOptionFunction=false;
                    // console.log(3)
                }
            })
        }
    }
}

// ################################# delete the post #################################


let deletePostButtons = document.querySelectorAll(`.deletePostButton`) || null

deletePostButtons.forEach((e)=>{
    e.onclick=()=>{
        function deleteThePost() {
    
            const xhr = new XMLHttpRequest(); 
            const url = `/post/${e.dataset.requestId}`;
            
                xhr.open('delete', url, true);
            
                xhr.setRequestHeader('Content-Type', 'application/json'); 
                xhr.setRequestHeader('X-CSRF-TOKEN', document.querySelector('meta[name="csrf-token"]').content);

                xhr.onload = function () {
                    if (xhr.status === 200 ) {

                        try {

                        const response = JSON.parse(xhr.responseText); // محاولة تحليل الاستجابة كـ JSON
                        e.parentElement.parentElement.remove();
                        console.log(response.message)

                        }

                        catch{
                            console.log(`ERROR 404`)
                        }
                    }
                }
                xhr.send();
        }
        deleteThePost();
        e.parentElement.parentElement.parentElement.parentElement.remove();
        // console.log(e.dataset.requestId)    
    }
})

// ################################# edite the post #################################


let editePostButtons = document.querySelectorAll(`.editePostButton`) || null

editePostButtons.forEach((e)=>{
    e.onclick=()=>{
        alert(`this function is not exist yet`)
    }
})

// ################################# send the post #################################


let sendPostButtons = document.querySelectorAll(`.sendPostButton`) || null

sendPostButtons.forEach((e)=>{
    e.onclick=()=>{
        alert(`this function is not exist yet`)
    }
})

// ################################# goToProfile #################################


let goToProfile = document.querySelector(`.goToProfile`) || null

    goToProfile.onclick=()=>{
        alert(`YOU can not change your profile information yet`)
    }
