<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_panel.aspx.cs" Inherits="webapp1.User_panel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Cements for U</title>  
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <form id="form1" runat="server">
        <div  class="wrapper">

          <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="User_panel.aspx" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>
    <div class="offset-sm-8">
        <asp:Button ID="Button1" runat="server" Text="Logout" class="btn btn-primary btn-block" OnClick="Button1_Click" />
    </div>

   

    <!-- Right navbar links -->
    
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="#" class="brand-link">
      <img src="../../dist/img/AdminLTELogo.png"
           alt="AdminLTE Logo"
           class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">Cements for U</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="user_info.aspx" class="d-block">
          <asp:Label ID="Label1" runat="server" ></asp:Label>

          </a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview">
            <a class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                My Account
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="cement_history.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>History</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="user_dist_info.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Distributers</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="user_info.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Profile</p>
                </a>
              </li>
            </ul>
          </li>
       
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

            <div class="content-wrapper">
            <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Recent Purchases</h1>
          </div>
          
        </div>
      </div><!-- /.container-fluid -->
    </section>
         
              <div class="col-sm-6">
                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                      <Columns>
                          <asp:BoundField DataField="Dist_No" HeaderText="Dist_No" SortExpression="Dist_No"></asp:BoundField>
                          <asp:BoundField DataField="Dist_Name" HeaderText="Dist_Name" SortExpression="Dist_Name"></asp:BoundField>
                          <asp:BoundField DataField="Company_Name" HeaderText="Company_Name" SortExpression="Company_Name"></asp:BoundField>
                          <asp:BoundField DataField="Product_name" HeaderText="Product_name" SortExpression="Product_name"></asp:BoundField>
                          <asp:BoundField DataField="Number_Of_CementBags" HeaderText="Number_Of_CementBags" SortExpression="Number_Of_CementBags"></asp:BoundField>
                          <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount"></asp:BoundField>
                      </Columns>
                      <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

                      <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

                      <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

                      <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                      <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                      <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

                      <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                      <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
                  </asp:GridView>
                  <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [Dist_No], [Dist_Name], [Company_Name], [Product_name], [Number_Of_CementBags], [Amount] FROM [PurchaseHistory] WHERE ([User_No] = @User_No)">
                      <SelectParameters>
                          <asp:SessionParameter SessionField="User_no" Name="User_No" Type="String"></asp:SessionParameter>
                      </SelectParameters>
                  </asp:SqlDataSource>
              </div>

              </div>

          <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      
    </div>
    <strong>Copyright &copy; 2021 <a href="#">Krupa Bhimani & Anjali Bhavsar</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

        </div>
    </form>


  <script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
</body>
</html>
