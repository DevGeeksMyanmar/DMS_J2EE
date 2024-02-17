<%@ include file="../../layout/header.jsp" %> <%@ include
file="../../layout/shop_sidenav.jsp" %> <%@ page import="model.User" %> <%
Object userObj = session.getAttribute("user"); if (userObj == null) {
response.sendRedirect("/DMS/views/login.jsp"); } else if (userObj == null ||
!(userObj instanceof User)) { response.sendRedirect("/DMS/views/login.jsp"); }
else { User user = (User) userObj; if (!"shop".equals(user.getRole())) {
response.sendRedirect("/DMS/views/login.jsp"); } } %>

<!-- Main content -->
<div class="p-5 md:p-10 grid grid-cols-2 sm:ml-64">
  <div class="bg-white p-5 max-w-2xl mx-auto rounded-xl mt-10 md:mt-20"></div>
  <div class="bg-white p-5 max-w-2xl mx-auto rounded-xl mt-10 md:mt-20"></div>
  <div class="text-right mt-4">
    <button
      class="text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
    >
      Submit Order
    </button>
  </div>
</div>
<div class="">
  <button
    id="btn-submit"
    class="flex text-white bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-md text-sm px-5 py-3 text-lg text-center me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
  >
    Submit Order
    <svg
      class="inline-block ms-1 w-5 h-5"
      xmlns="http://www.w3.org/2000/svg"
      width="32"
      height="32"
      viewBox="0 0 24 24"
    >
      <g fill="none">
        <path
          d="M24 0v24H0V0zM12.593 23.258l-.011.002l-.071.035l-.02.004l-.014-.004l-.071-.035c-.01-.004-.019-.001-.024.005l-.004.01l-.017.428l.005.02l.01.013l.104.074l.015.004l.012-.004l.104-.074l.012-.016l.004-.017l-.017-.427c-.002-.01-.009-.017-.017-.018m.265-.113l-.013.002l-.185.093l-.01.01l-.003.011l.018.43l.005.012l.008.007l.201.093c.012.004.023 0 .029-.008l.004-.014l-.034-.614c-.003-.012-.01-.02-.02-.022m-.715.002a.023.023 0 0 0-.027.006l-.006.014l-.034.614c0 .012.007.02.017.024l.015-.002l.201-.093l.01-.008l.004-.011l.017-.43l-.003-.012l-.01-.01z"
        />
        <path
          fill="currentColor"
          d="M20.25 3.532a1 1 0 0 1 1.183 1.329l-6 15.5a1 1 0 0 1-1.624.362l-3.382-3.235l-1.203 1.202c-.636.636-1.724.186-1.724-.714v-3.288L2.309 9.723a1 1 0 0 1 .442-1.691l17.5-4.5Zm-2.114 4.305l-7.998 6.607l3.97 3.798zm-1.578-1.29L4.991 9.52l3.692 3.53l7.875-6.505Z"
        />
      </g>
    </svg>
  </button>
</div>

<script src="/DMS/assets/js/createOrder.js"></script>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("#orderForm");
    const ordersDiv = document.querySelector("#orders");
    const orders = [];

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
      ordersDiv.innerHTML = "";
      //let allOrders = '';
      orders.forEach((order, index) => {
        const orderDiv = document.createElement("div");

        orderDiv.style.border = "1px solid black";
        orderDiv.style.padding = "10px";
        orderDiv.style.marginBottom = "10px";

        orderDiv.innerHTML =
          "Order " +
          (index + 1) +
          ":<br>" +
          "Product Name: " +
          order.productName +
          "<br>" +
          "Product Price: " +
          order.productPrice +
          "<br>" +
          "Order Count: " +
          order.orderCount +
          "<br><br>";

        ordersDiv.appendChild(orderDiv);
      });
      //orderField.value = allOrders;
    };
  });
</script>

<%@ include file="../../layout/footer.jsp" %>
