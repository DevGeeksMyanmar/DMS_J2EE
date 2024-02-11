/**
 *
 */

const form = document.querySelector("#orderForm");
var ordersDiv = document.querySelector("#orders");
var orders = [];

form.addEventListener("submit", (event) => {
  event.preventDefault();
  // Get the input values

  const productName = document.querySelector("#productName").value;
  const productPrice = document.querySelector("#productPrice").value;
  const orderCount = document.querySelector("#orderCount").value;
  // Add  order to  orders array
  orders.push({
    productName: productName,
    productPrice: productPrice,
    orderCount: orderCount,
  });

  document.querySelector("#productName").value = "";
  document.querySelector("#productPrice").value = "";
  document.querySelector("#orderCount").value = "";

  allOrders();
});

const allOrders = () => {
document.querySelector(
      "#orders"
    ).innerHTML = "";
  orders.forEach((order, index) => {
   
    document.querySelector(
      "#orders"
    ).innerHTML += `<div class="p-3 h-fit bg-white border-[1.5px] border-slate-400 rounded-lg  me-2 mb-2"><p class="text-base">${order.productName}<span class="text-blue-600 ms-2">(${order.orderCount} items)</span></p>
            <p class="text-sm mt-1 text-zinc-700">
<svg class="inline-block  w-5 h-5 " xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 256 256"><path fill="currentColor" d="M128 24a104 104 0 1 0 104 104A104.11 104.11 0 0 0 128 24m0 192a88 88 0 1 1 88-88a88.1 88.1 0 0 1-88 88m40-68a28 28 0 0 1-28 28h-4v8a8 8 0 0 1-16 0v-8h-16a8 8 0 0 1 0-16h36a12 12 0 0 0 0-24h-24a28 28 0 0 1 0-56h4v-8a8 8 0 0 1 16 0v8h16a8 8 0 0 1 0 16h-36a12 12 0 0 0 0 24h24a28 28 0 0 1 28 28"/></svg>
${order.productPrice} ks</p>
            </div>
            `;
  });

};


