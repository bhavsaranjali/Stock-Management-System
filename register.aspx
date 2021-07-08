<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="webapp1.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title> Registration Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition register-page">
    <form id="form1" runat="server" >
        <div>

           <div class="register-box">
  <div class="register-logo">
  <b>Cements</b>forU
  </div>

  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">Register a new membership</p>

        </div>
        <div class="input-group mb-3">
          
          <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Full name"></asp:TextBox>

          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
         
          <asp:TextBox ID="TextBox2" runat="server" placeholder="Mobile No."  class="form-control" TextMode="Number" ></asp:TextBox>

          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          
          <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Password" TextMode="Password" ></asp:TextBox>

          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>

        
        <div class="row">
          <div class="col-7">
            <div class="icheck-primary">
              &nbsp;
              <asp:CheckBox  runat="server" id="agreeTerms"  />
              <label for="agreeTerms">
               I agree to the <a href="#">terms</a>
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-5">            
            <asp:Button ID="Button1" runat="server" Text="Register" class="btn btn-primary btn-block" OnClick="btnclick" />
          </div>
          <!-- /.col -->
        </div>

      <div class="social-auth-links text-center">
        <p>- OR -</p>
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i>
          Sign up using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i>
          Sign up using Google+
        </a>
      </div>

      <a href="login.aspx" class="text-center">I already have a membership</a>
    <asp:Label ID="Label1" runat="server" ></asp:Label>

    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->

<!-- /.register-box -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
      </div>
        
    </form>
      
</body>
</html>
