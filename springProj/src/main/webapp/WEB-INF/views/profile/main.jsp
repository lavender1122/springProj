<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<title></title>
<script type="text/javascript">
$(function(){
$.ajax({
	url:"/profile/profileList",
	type:"get",
	dataType:"json",
	success:function(result){
		console.log(result)
// 		console.log(result.userName);
		$('#userName').text(result.userName);
		$('#profileUserImg').text(result.profileUserImg);
		$('#introduction').text(result.introduction);
		$('#education').text(result.education);
		$('#locationProfile').text(result.location);
		$('#skills').text(result.skills);
		$('#notes').text(result.notes);
	}
});//ajax end
//배열
$.ajax({
	url:"/profile/activityAjax",
	type:"get",
	dataTyep:"json",
	success:function(result){
		// console.log(result);
		//함수로 만들어서 넘긴다!!
		getAlert(result)
		
	}
});
// 		alert(date[0]);//ref이라서 데이터가 없다!!
$("#btnPlus").on("click",function(){
   let pAreaLen = $(".pArea").length;
   // console.log(pAreaLen);
   let str ="";
       str +=" <p class='pArea'>";
       str +="<input type='text' name='setVOList[0].type' id='inputSkill' class='form-control'";
       str +="placeholder='Skills'>";
       str +="</p>   ";
       console.log(">>>",$(".pArea").eq(0));
//        console.log(">>>",$("#btnSubmit").parent().parent().children());
       $(".pArea").eq(0).after(str);
});
$("#btnMinus").on("click",function(){
   let pAreaLen = $(".pArea").length;
   console.log("minuse ck");
   console.log("pAreaLen",pAreaLen);
   if(pAreaLen <2){
      alert("최소 하나 존재해야합니다");
      return;
   }
   // $(".pArea").last().next().remove();
   $(".pArea").last().remove();

})
$("#btnSubmit").on("click",function(){
   //일반폼데이터
   let userName = $("#inputUserName").val();
   let introduction = $("#inputIntroduction").val();
   let education = $("#inputEducation").val();
   let locationProfile = $("#inputLocation").val();
   let skills = $("#inputSkills").val();
   let notes = $("#inputNotes").val();
   // console.log("ck",userName,introduction,education,location,skills,notes);
   
   let formData = new FormData();
   formData.append("userName",userName);
   formData.append("introduction",introduction);
   formData.append("education",education);
   formData.append("location",locationProfile);
   formData.append("notes",notes);

   //파일폼데이터
   let fileObj = $("#inputProfileUserImg");
   let file = fileObj[0].files;

   // console.log("file.lentgh: ",file.length);
   for(let i =0;i<file.length;i++){
      formData.append("profileUpdateUserImg",file[i]);
   }
   $(".pArea").each(function(idx,data){
      console.log("idx:", idx);
      // console.log("data:", data);
      console.log($(this).children().eq(0));
      console.log($(this).children().eq(0).val());
      let setVOList= $(this).children().eq(0).val();
      console.log("setVOList",setVOList);
      formData.append("setVOList["+idx+"].seq",idx+1)
      formData.append("setVOList["+idx+"].type",setVOList)
   })
   $.ajax({
      url:"/profile/settingCreateAjax",
      processData:false,
      contentType:false,
      data:formData,
      type:"post",
      dataType:"text",
      success:function(result){
         console.log("result",result);
         alert("체킁"+location.href);
         location.replace(location.href);

      }
   })
});//#btnsubmit end

function getAlert(result){
	let str ="";
   $.each(result,function(idx,Activity){
   str +="<div class='user-block'>";
   str +="<img class='img-circle img-bordered-sm'";
   str +="src='/resources/img/user1-128x128.jpg' alt='user image'>";
   str +="<span class='username'> <a href='#'>"+Activity.postId+"";
   str +="Jr.</a> <a href='#' class='float-right btn-tool'><i";
   str +="class='fas fa-times'></i></a>";
   str +="</span> <span class='description'>"+Activity.postType+"-"+Activity.postDate;
   str +="</span>";
   str +="</div><br/>";
   str +="<br/>";
   str +="<p id='activityComment'>"+Activity.activityComment+"</p>";
   str +=" <p> ";
   str +="<a href='#' class='link-black text-sm mr-2'><i";
   str +="class='fas fa-share mr-1'></i> Share</a> <a href='#'";
   str +="class='link-black text-sm'><i";
   str +="class='far fa-thumbs-up mr-1'></i> Like</a> <span ";
   str +="class='float-right'> <a href='#'";
   str +="class='link-black text-sm'> <i";
   str +="class='far fa-comments mr-1'></i> Comments (5)";
   str +="</a>";
   str +="</span>";
   str +="</p>";
   str +="<input class='form-control form-control-sm' type='text'";
   str +="placeholder='Type a comment'>   ";	
   str +="<br/>";
   //end
   });
      
      $(".post").after(str);
	
   
	// console.log(result.length)//2
		// $("#content").text(JSON.stringify(result[0].activityComment));
	}
});//$function end
</script>
</head>
<body>
   <section class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-6">
               <h1>Profile</h1>
            </div>
            <div class="col-sm-6">
               <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="#">Home</a></li>
                  <li class="breadcrumb-item active">User Profile</li>
               </ol>
            </div>
         </div>
      </div>
   </section>
   <section class="content">
      <div class="container-fluid">
         <div class="row">
            <div class="col-md-3">

               <div class="card card-primary card-outline">
                  <div class="card-body box-profile">
                     <div class="text-center">
                        <img class="profile-user-img img-fluid img-circle"
                           src="/resources/img/user4-128x128.jpg"
                           alt="User profile picture">
                     </div>
                     <h3 class="profile-username text-center" id="userName"></h3>
                     <p class="text-muted text-center" id="introduction"></p>
                     <ul class="list-group list-group-unbordered mb-3">
                        <li class="list-group-item"><b>Followers</b> <a
                           class="float-right">1,322</a></li>
                        <li class="list-group-item"><b>Following</b> <a
                           class="float-right">543</a></li>
                        <li class="list-group-item"><b>Friends</b> <a
                           class="float-right">13,287</a></li>
                     </ul>
                     <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
                  </div>

               </div>


               <div class="card card-primary">
                  <div class="card-header">
                     <h3 class="card-title">About Me</h3>
                  </div>

                  <div class="card-body">
                     <strong><i class="fas fa-book mr-1"></i> Education</strong>
                     <p class="text-muted" id="education"></p>
                     <hr>
                     <strong><i class="fas fa-map-marker-alt mr-1"></i>
                        Location</strong>
                     <p class="text-muted" id="locationProfile"></p>
                     <hr>
                     <strong><i class="fas fa-pencil-alt mr-1"></i> Skills</strong>
                     <p class="text-muted" id="skills">
                     </p>
                     <hr>
                     <strong><i class="far fa-file-alt mr-1"></i> Notes</strong>
                     <p class="text-muted" id="notes"></p>
                  </div>

               </div>

            </div>

            <div class="col-md-9">
               <div class="card">
                  <div class="card-header p-2">
                     <ul class="nav nav-pills">
                        <li class="nav-item"><a class="nav-link active"
                           href="#activity" data-toggle="tab">Activity</a></li>
                        <li class="nav-item"><a class="nav-link" href="#timeline"
                           data-toggle="tab">Timeline</a></li>
                        <li class="nav-item"><a class="nav-link" href="#settings"
                           data-toggle="tab">Settings</a></li>
                     </ul>
                  </div>
                  <div class="card-body">
                     <div class="tab-content">
                        <div class="tab-pane active" id="activity">
                        <!-- list -->
                        <p id="activityList">
                           <div class="post">
<!--                               <div class="user-block"> -->
<!--                                  <img class="img-circle img-bordered-sm" -->
<!--                                     src="/resources/img/user1-128x128.jpg" alt="user image"> -->
<!--                                  <span class="username"> <a href="#">Jonathan Burke -->
<!--                                        Jr.</a> <a href="#" class="float-right btn-tool"><i -->
<!--                                        class="fas fa-times"></i></a> -->
<!--                                  </span> <span class="description">Shared publicly - 7:30 PM -->
<!--                                     today</span> -->
<!--                               </div> -->

<!--                               <p id="activityComment"></p> -->
<!-- 	                             <p>  -->
<!--                                  <a href="#" class="link-black text-sm mr-2"><i -->
<!--                                     class="fas fa-share mr-1"></i> Share</a> <a href="#" -->
<!--                                     class="link-black text-sm"><i -->
<!--                                     class="far fa-thumbs-up mr-1"></i> Like</a> <span -->
<!--                                     class="float-right"> <a href="#" -->
<!--                                     class="link-black text-sm"> <i -->
<!--                                        class="far fa-comments mr-1"></i> Comments (5) -->
<!--                                  </a> -->
<!--                                  </span> -->
<!--                               </p> -->
<!--                               <input class="form-control form-control-sm" type="text" -->
<!--                                  placeholder="Type a comment"> -->
                           </div>
						</p>
								<!-- send -->
<!--                            <div class="post clearfix"> -->
<!--                               <div class="user-block"> -->
<!--                                  <img class="img-circle img-bordered-sm" -->
<!--                                     src="/resources/img/user7-128x128.jpg" alt="User Image"> -->
<!--                                  <span class="username"> <a href="#">Sarah Ross</a> <a -->
<!--                                     href="#" class="float-right btn-tool"><i -->
<!--                                        class="fas fa-times"></i></a> -->
<!--                                  </span> <span class="description">Sent you a message - 3 days -->
<!--                                     ago</span> -->
<!--                               </div> -->

<!--                               <p>Lorem ipsum represents a long-held tradition for -->
<!--                                  designers, typographers and the like. Some people hate it and -->
<!--                                  argue for its demise, but others ignore the hate as they -->
<!--                                  create awesome tools to help create filler text for everyone -->
<!--                                  from bacon lovers to Charlie Sheen fans.</p> -->
<!--                               <form class="form-horizontal"> -->
<!--                                  <div class="input-group input-group-sm mb-0"> -->
<!--                                     <input class="form-control form-control-sm" -->
<!--                                        placeholder="Response"> -->
<!--                                     <div class="input-group-append"> -->
<!--                                        <button type="submit" class="btn btn-danger">Send</button> -->
<!--                                     </div> -->
<!--                                  </div> -->
<!--                               </form> -->
<!--                            </div> -->

							<!-- 사진 -->
                           <!-- <div class="post">
                              <div class="user-block">
                                 <img class="img-circle img-bordered-sm"
                                    src="/resources/img/user6-128x128.jpg" alt="User Image">
                                 <span class="username"> <a href="#">Adam Jones</a> <a
                                    href="#" class="float-right btn-tool"><i
                                       class="fas fa-times"></i></a>
                                 </span> <span class="description">Posted 5 photos - 5 days
                                    ago</span>
                              </div>

                              <div class="row mb-3">
                                 <div class="col-sm-6">
                                    <img class="img-fluid" src="/resources/img/photo1.png"
                                       alt="Photo">
                                 </div>

                                 <div class="col-sm-6">
                                    <div class="row">
                                       <div class="col-sm-6">
                                          <img class="img-fluid mb-3"
                                             src="/resources/img/photo2.png" alt="Photo"> <img
                                             class="img-fluid" src="/resources/img/photo3.jpg"
                                             alt="Photo">
                                       </div>

                                       <div class="col-sm-6">
                                          <img class="img-fluid mb-3"
                                             src="/resources/img/photo4.jpg" alt="Photo"> <img
                                             class="img-fluid" src="/resources/img/photo1.png"
                                             alt="Photo">
                                       </div>

                                    </div>

                                 </div>

                              </div>

                              <p>
                                 <a href="#" class="link-black text-sm mr-2"><i
                                    class="fas fa-share mr-1"></i> Share</a> <a href="#"
                                    class="link-black text-sm"><i
                                    class="far fa-thumbs-up mr-1"></i> Like</a> <span
                                    class="float-right"> <a href="#"
                                    class="link-black text-sm"> <i
                                       class="far fa-comments mr-1"></i> Comments (5)
                                 </a>
                                 </span>
                              </p>
                              <input class="form-control form-control-sm" type="text"
                                 placeholder="Type a comment">
                           </div> -->

                        </div>

                        <div class="tab-pane" id="timeline">

                           <div class="timeline timeline-inverse">

                              <div class="time-label">
                                 <span class="bg-danger"> 10 Feb. 2014 </span>
                              </div>


                              <div>
                                 <i class="fas fa-envelope bg-primary"></i>
                                 <div class="timeline-item">
                                    <span class="time"><i class="far fa-clock"></i> 12:05</span>
                                    <h3 class="timeline-header">
                                       <a href="#">Support Team</a> sent you an email
                                    </h3>
                                    <div class="timeline-body">Etsy doostang zoodles
                                       disqus groupon greplin oooj voxy zoodles, weebly ning
                                       heekya handango imeem plugg dopplr jibjab, movity jajah
                                       plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                                       quora plaxo ideeli hulu weebly balihoo...</div>
                                    <div class="timeline-footer">
                                       <a href="#" class="btn btn-primary btn-sm">Read more</a> <a
                                          href="#" class="btn btn-danger btn-sm">Delete</a>
                                    </div>
                                 </div>
                              </div>


                              <div>
                                 <i class="fas fa-user bg-info"></i>
                                 <div class="timeline-item">
                                    <span class="time"><i class="far fa-clock"></i> 5
                                       mins ago</span>
                                    <h3 class="timeline-header border-0">
                                       <a href="#">Sarah Young</a> accepted your friend request
                                    </h3>
                                 </div>
                              </div>


                              <div>
                                 <i class="fas fa-comments bg-warning"></i>
                                 <div class="timeline-item">
                                    <span class="time"><i class="far fa-clock"></i> 27
                                       mins ago</span>
                                    <h3 class="timeline-header">
                                       <a href="#">Jay White</a> commented on your post
                                    </h3>
                                    <div class="timeline-body">Take me to your leader!
                                       Switzerland is small and neutral! We are more like Germany,
                                       ambitious and misunderstood!</div>
                                    <div class="timeline-footer">
                                       <a href="#" class="btn btn-warning btn-flat btn-sm">View
                                          comment</a>
                                    </div>
                                 </div>
                              </div>


                              <div class="time-label">
                                 <span class="bg-success"> 3 Jan. 2014 </span>
                              </div>


                              <div>
                                 <i class="fas fa-camera bg-purple"></i>
                                 <div class="timeline-item">
                                    <span class="time"><i class="far fa-clock"></i> 2
                                       days ago</span>
                                    <h3 class="timeline-header">
                                       <a href="#">Mina Lee</a> uploaded new photos
                                    </h3>
                                    <div class="timeline-body">
                                       <img src="https://placehold.it/150x100" alt="..."> <img
                                          src="https://placehold.it/150x100" alt="..."> <img
                                          src="https://placehold.it/150x100" alt="..."> <img
                                          src="https://placehold.it/150x100" alt="...">
                                    </div>
                                 </div>
                              </div>

                              <div>
                                 <i class="far fa-clock bg-gray"></i>
                              </div>
                           </div>
                        </div>

                        <div class="tab-pane" id="settings">
                           <form action="/profile/settingCreateAjax" method="post" class="form-horizontal" enctype="multipart/form-data">
                              <div class="form-group row">
                                 <label for="inputName" class="col-sm-2 col-form-label">userName</label>
                                 <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputUserName"
                                       placeholder="UserName">
                                 </div>
                              </div>
                              <div class="form-group row 1">
                                 <label for="inputEmail" class="col-sm-2 col-form-label">introduction</label>
                                 <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputIntroduction"
                                       placeholder="Introduction">
                                 </div>
                              </div>
                              <div class="form-group row 2">
                                 <label for="inputName2" class="col-sm-2 col-form-label">education</label>
                                 <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputEducation"
                                       placeholder="Education">
                                 </div>
                              </div>
                              <div class="form-group row 3">
                                 <label for="inputExperience" class="col-sm-2 col-form-label">location</label>
                                 <div class="col-sm-10">
                                    <textarea class="form-control" id="inputLocation"
                                       placeholder="Location"></textarea>
                                 </div>
                              </div>
                                 <div class="form-group row pSkill">
                                    <label for="inputSkills" class="col-sm-2 col-form-label">Skills</label>
                                    <div class="col-sm-10">
                                       <p id="pFunc">
                                          <button type="button"  class="btn btn-info btn-sm col-sm-1" id="btnPlus">+</button>
                                          <button type="button"  class="btn btn-info btn-sm col-sm-1" id="btnMinus">-</button>
                                       </p>
                                       <p class="pArea">
                                          <input type="text" name="setVOList[0].type" id="inputSkill" class="form-control"
                                          placeholder="Skills">
                                       </p>
                                    </div>
                                 </div>
                              <div class="form-group row">
                                 <label for="inputSkills" class="col-sm-2 col-form-label">Notes</label>
                                 <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputNotes"
                                       placeholder="Notes">
                                 </div>
                              </div>
                              <div class="form-group row">
                                 <label for="inputSkills" class="col-sm-2 col-form-label">profileUserImg</label>
                                 <div class="col-sm-10">
                                    <input type="file" class="form-control" id="inputProfileUserImg" name="profileUpdateUserImg">
                                 </div>
                              </div>
                              <div class="form-group row">
                                 <div class="offset-sm-2 col-sm-10">
                                    <button type="button" id="btnSubmit" class="btn btn-danger">Submit</button>
                                 </div>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
</body>
</html>