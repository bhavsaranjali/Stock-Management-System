<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_info.aspx.cs" Inherits="webapp1.user_info" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>User Panel</title>
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
  <!-- Navbar -->
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

    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <div>
        <asp:Button ID="Button1" runat="server" Text="Edit" class="btn btn-primary btn-block" OnClick="Button1_Click1" />
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

            <asp:Label ID="Label9" runat="server"></asp:Label>

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

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Profile</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="User_panel.aspx">Home</a></li>
              <li class="breadcrumb-item active">User Profile</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-9">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="../../dist/img/profile.png"
                       alt="User profile picture">
                </div>

                <h3 class="profile-username text-center">

                    <asp:Label ID="Label1" runat="server" ></asp:Label>
                 

                </h3>

               
               <div class="card">
             
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table">
                  <thead>
                   
                  </thead>
                  <tbody>
                    <tr>
                      
                      <td>Name</td>
                      <td>
                       
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                      </td>
                     
                    </tr>
                    <tr>
                     
                      <td>Mobile No.</td>
                      <td>
                        <asp:Label ID="Label3" runat="server" ></asp:Label>
                      </td>
                      
                    </tr>
                    <tr>
                      
                      <td>Gender</td>
                      <td>
                         <asp:Label ID="Label4" runat="server" ></asp:Label>
                        
                      </td>
                     
                    </tr>
                    <tr>
                      
                      <td>Age</td>
                      <td>
                        <asp:Label ID="Label5" runat="server" ></asp:Label>
                      </td>
                    </tr>
                    <tr>
                      <th>Address:</th>
                    </tr>
                    <tr>
                      <td>
                        Street
                      </td>
                      <td>
                      <asp:Label ID="Label6" runat="server" ></asp:Label>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Road
                      </td>
                      <td>
                      <asp:Label ID="Label7" runat="server" ></asp:Label>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        City
                      </td>
                      <td>
                      <asp:Label ID="Label8" runat="server" ></asp:Label>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>

               
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            
          </div>
          
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
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
