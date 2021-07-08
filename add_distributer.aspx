<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_distributer.aspx.cs" Inherits="webapp1.add_distributer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Admin Panel</title>
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
<body class="hold-transition sidebar-mini">
    <form id="form1" runat="server">
        <div class="wrapper">
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="Admin_panel.aspx" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>

    <!-- SEARCH FORM -->
   
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>

    <!-- Right navbar links -->
    
  </nav> 
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
          <a href="#" class="d-block">

            <asp:Label ID="Label9" runat="server" Text="Admin"></asp:Label>

          </a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                My Account
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="distributerInfo_admin.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Distributer</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Add Distributer</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Stock</p>
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
           <div class="content">
      <div class="container-fluid">
        <div class="row ">
          <!-- left column -->
          <div class=" col-lg-6 ">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Distributor Details</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputname">Distributor Name</label>
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Enter Name" required=""></asp:TextBox>
                  </div>
                   <div class="form-group">
                    <label for="exampleInputphone no">Mobile Number</label>
                  <asp:TextBox ID="TextBox2" runat="server" class="form-control"  placeholder="Enter Phone No" TextMode="Number" required=""></asp:TextBox>
                    
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <asp:TextBox ID="TextBox3" runat="server" class="form-control"  placeholder="Password" TextMode="Password" required=""></asp:TextBox>
                   </div>                 
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary" OnClick="Button1_Click" />
                  <asp:Button ID="Button2" runat="server" Text="Show" class="btn btn-primary" OnClick="Button2_Click"/>              
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
              </div>
            </div>
        </div><!-- /.row -->
      </div>
        
    </div>  <!-- /.container-fluid -->
    <!-- /.content-header -->
      </div>

                </div>
    </form>
   <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      
    </div>
    <strong>Copyright &copy; 2021 <a href="#">Krupa Bhimani & Anjali Bhavsar</a>.</strong> All rights
    reserved.
  </footer>
          <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
        </div>
    </form>

  <!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
</body>
</html>
