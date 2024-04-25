<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" 
   rel="stylesheet">
<link rel="stylesheet" href="/resources/css/adminlte.min.css?v=3.2.0">
<title>Insert title here</title>
</head>
<body class="sidebar-mini sidebar-closed sidebar-collapse" style="height: auto;">
   <div class="wrapper">
      <div class="content-wrapper" style="min-height: 93px;">

         <section class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1>Project Add</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Project Add</li>
                     </ol>
                  </div>
               </div>
            </div>
         </section>

         <section class="content">
         <form action="/projectAdd/create" method="post">
            <div class="row">
               <div class="col-md-6">
                  <div class="card card-primary">
                     <div class="card-header">
                        <h3 class="card-title">General</h3>
                        <div class="card-tools">
                           <button type="button" class="btn btn-tool"
                              data-card-widget="collapse" title="Collapse">
                              <i class="fas fa-minus"></i>
                           </button>
                        </div>
                     </div>
                     <div class="card-body">
                        <div class="form-group">
                           <label for="inputName">Project Name</label>
                           <input type="text" id="inputName" name="projNm" class="form-control">
                        </div>
                        <div class="form-group">
                           <label for="inputDescription">Project Description</label>
                           <textarea id="inputDescription" name="projDstn" class="form-control" rows="4"></textarea>
                        </div>
                        <div class="form-group">
                           <label for="inputStatus">Status</label>
                           <select name="stat"
                              id="inputStatus" class="form-control custom-select">
                              <option selected="" disabled="">Select one</option>
                              <option>On Hold</option>
                              <option>Canceled</option>
                              <option>Success</option>
                           </select>
                        </div>
                        <div class="form-group">
                           <label for="inputClientCompany">Client Company</label>
                           <input type="text" name="cltComp" id="inputClientCompany" class="form-control">
                        </div>
                        <div class="form-group">
                           <label for="inputProjectLeader">Project Leader</label>
                           <input type="text" name="projLdr" id="inputProjectLeader" class="form-control">
                        </div>
                     </div>

                  </div>

               </div>
               <div class="col-md-6">
                  <div class="card card-secondary">
                     <div class="card-header">
                        <h3 class="card-title">Budget</h3>
                        <div class="card-tools">
                           <button type="button" class="btn btn-tool"
                              data-card-widget="collapse" title="Collapse">
                              <i class="fas fa-minus"></i>
                           </button>
                        </div>
                     </div>
                     <div class="card-body">
                        <div class="form-group">
                           <label for="inputEstimatedBudget">Estimated budget</label>
                           <input type="text" name="estBgt" id="inputEstimatedBudget" class="form-control">
                        </div>
                        <div class="form-group">
                           <label for="inputSpentBudget">Total amount spent</label>
                           <input type="text" name="totAmt" id="inputSpentBudget" class="form-control">
                        </div>
                        <div class="form-group">
                           <label for="inputEstimatedDuration">Estimated project duration</label>
                           <input type="text" name="estProjDon" id="inputEstimatedDuration" class="form-control">
                        </div>
                     </div>

                  </div>

               </div>
            </div>
            <div class="row">
               <div class="col-12">
                  <a href="#" class="btn btn-secondary">Cancel</a> <input
                     type="submit" value="Create new Project"
                     class="btn btn-success float-right">
               </div>
            </div>
            </form>
         </section>

      </div>

      <footer class="main-footer">
         <div class="float-right d-none d-sm-block">
            <b>Version</b> 3.2.0
         </div>
         <strong>Copyright © 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.
         </strong> All rights reserved.
      </footer>

      <aside class="control-sidebar control-sidebar-dark"
         style="display: none;">

         <div class="p-3 control-sidebar-content" style="">
            <h5>Customize AdminLTE</h5>
            <hr class="mb-2">
            <div class="mb-4">
               <input type="checkbox" value="1" class="mr-1"><span>Dark
                  Mode</span>
            </div>
            <h6>Header Options</h6>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Fixed</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Dropdown
                  Legacy Offset</span>
            </div>
            <div class="mb-4">
               <input type="checkbox" value="1" class="mr-1"><span>No
                  border</span>
            </div>
            <h6>Sidebar Options</h6>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Collapsed</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Fixed</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" checked="checked" class="mr-1"><span>Sidebar
                  Mini</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Sidebar
                  Mini MD</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Sidebar
                  Mini XS</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Nav
                  Flat Style</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Nav
                  Legacy Style</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Nav
                  Compact</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Nav
                  Child Indent</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Nav
                  Child Hide on Collapse</span>
            </div>
            <div class="mb-4">
               <input type="checkbox" value="1" class="mr-1"><span>Disable
                  Hover/Focus Auto-Expand</span>
            </div>
            <h6>Footer Options</h6>
            <div class="mb-4">
               <input type="checkbox" value="1" class="mr-1"><span>Fixed</span>
            </div>
            <h6>Small Text Options</h6>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Body</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Navbar</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Brand</span>
            </div>
            <div class="mb-1">
               <input type="checkbox" value="1" class="mr-1"><span>Sidebar
                  Nav</span>
            </div>
            <div class="mb-4">
               <input type="checkbox" value="1" class="mr-1"><span>Footer</span>
            </div>
            <h6>Navbar Variants</h6>
            <div class="d-flex">
               <select class="custom-select mb-3 text-light border-0 bg-white"><option
                     class="bg-primary">Primary</option>
                  <option class="bg-secondary">Secondary</option>
                  <option class="bg-info">Info</option>
                  <option class="bg-success">Success</option>
                  <option class="bg-danger">Danger</option>
                  <option class="bg-indigo">Indigo</option>
                  <option class="bg-purple">Purple</option>
                  <option class="bg-pink">Pink</option>
                  <option class="bg-navy">Navy</option>
                  <option class="bg-lightblue">Lightblue</option>
                  <option class="bg-teal">Teal</option>
                  <option class="bg-cyan">Cyan</option>
                  <option class="bg-dark">Dark</option>
                  <option class="bg-gray-dark">Gray dark</option>
                  <option class="bg-gray">Gray</option>
                  <option class="bg-light">Light</option>
                  <option class="bg-warning">Warning</option>
                  <option class="bg-white">White</option>
                  <option class="bg-orange">Orange</option></select>
            </div>
            <h6>Accent Color Variants</h6>
            <div class="d-flex"></div>
            <select class="custom-select mb-3 border-0"><option>None
                  Selected</option>
               <option class="bg-primary">Primary</option>
               <option class="bg-warning">Warning</option>
               <option class="bg-info">Info</option>
               <option class="bg-danger">Danger</option>
               <option class="bg-success">Success</option>
               <option class="bg-indigo">Indigo</option>
               <option class="bg-lightblue">Lightblue</option>
               <option class="bg-navy">Navy</option>
               <option class="bg-purple">Purple</option>
               <option class="bg-fuchsia">Fuchsia</option>
               <option class="bg-pink">Pink</option>
               <option class="bg-maroon">Maroon</option>
               <option class="bg-orange">Orange</option>
               <option class="bg-lime">Lime</option>
               <option class="bg-teal">Teal</option>
               <option class="bg-olive">Olive</option></select>
            <h6>Dark Sidebar Variants</h6>
            <div class="d-flex"></div>
            <select class="custom-select mb-3 text-light border-0 bg-primary"><option>None
                  Selected</option>
               <option class="bg-primary">Primary</option>
               <option class="bg-warning">Warning</option>
               <option class="bg-info">Info</option>
               <option class="bg-danger">Danger</option>
               <option class="bg-success">Success</option>
               <option class="bg-indigo">Indigo</option>
               <option class="bg-lightblue">Lightblue</option>
               <option class="bg-navy">Navy</option>
               <option class="bg-purple">Purple</option>
               <option class="bg-fuchsia">Fuchsia</option>
               <option class="bg-pink">Pink</option>
               <option class="bg-maroon">Maroon</option>
               <option class="bg-orange">Orange</option>
               <option class="bg-lime">Lime</option>
               <option class="bg-teal">Teal</option>
               <option class="bg-olive">Olive</option></select>
            <h6>Light Sidebar Variants</h6>
            <div class="d-flex"></div>
            <select class="custom-select mb-3 border-0"><option>None
                  Selected</option>
               <option class="bg-primary">Primary</option>
               <option class="bg-warning">Warning</option>
               <option class="bg-info">Info</option>
               <option class="bg-danger">Danger</option>
               <option class="bg-success">Success</option>
               <option class="bg-indigo">Indigo</option>
               <option class="bg-lightblue">Lightblue</option>
               <option class="bg-navy">Navy</option>
               <option class="bg-purple">Purple</option>
               <option class="bg-fuchsia">Fuchsia</option>
               <option class="bg-pink">Pink</option>
               <option class="bg-maroon">Maroon</option>
               <option class="bg-orange">Orange</option>
               <option class="bg-lime">Lime</option>
               <option class="bg-teal">Teal</option>
               <option class="bg-olive">Olive</option></select>
            <h6>Brand Logo Variants</h6>
            <div class="d-flex"></div>
            <select class="custom-select mb-3 border-0"><option>None
                  Selected</option>
               <option class="bg-primary">Primary</option>
               <option class="bg-secondary">Secondary</option>
               <option class="bg-info">Info</option>
               <option class="bg-success">Success</option>
               <option class="bg-danger">Danger</option>
               <option class="bg-indigo">Indigo</option>
               <option class="bg-purple">Purple</option>
               <option class="bg-pink">Pink</option>
               <option class="bg-navy">Navy</option>
               <option class="bg-lightblue">Lightblue</option>
               <option class="bg-teal">Teal</option>
               <option class="bg-cyan">Cyan</option>
               <option class="bg-dark">Dark</option>
               <option class="bg-gray-dark">Gray dark</option>
               <option class="bg-gray">Gray</option>
               <option class="bg-light">Light</option>
               <option class="bg-warning">Warning</option>
               <option class="bg-white">White</option>
               <option class="bg-orange">Orange</option>
               <a href="#">clear</a></select>
         </div>
      </aside>

      <div id="sidebar-overlay"></div>
   </div>

</body>
</html>