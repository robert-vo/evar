<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Content.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
     <h2>
        Our Team</h2>
    <div class="row">
        <div class="span12">
            <p class='large'>
                TEAMOIE2S's diverse, talented team creates EVAR solutions that simplifies collaboration,
                organization, and empower users to create greater results for patients to
                live better, brighter lives.</p>
        </div>
    </div>
    <section id='features'>
        <div class="container">
            <div class='feature'>
                <img height="300" src="../../Images/sw.jpg" />
                <div class='description'>
                    <h2>
                        Francis Bermillo</h2>
                    <h5>
                        Team Leader</h5>
                    <p>
                        TL description</p>
                </div>
            </div>
            <div class='feature'>
                <img height="300" src="../../Images/grumpy.jpg" />
                <div class='description'>
                    <h2>
                        Joseph Eldridge</h2>
                    <h5>
                        Software Quality Assurance</h5>
                    <p>
                        SQA description</p>
                </div>
            </div>
            <div class='feature'>
                <img height="300" src="../../Images/bashful.jpg" />
                <div class='description'>
                    <h2>
                        Tri Nguyen</h2>
                    <h5>
                        Software Quality Assurance</h5>
                    <p>
                        SQA description</p>
                </div>
                <div class='feature'>
                    <img height="300" src="../../Images/dopey.jpg" />
                    <div class='description'>
                        <h2>
                            Robert Vo</h2>
                        <h5>
                            Database Administrator</h5>
                        <p>
                            DBA description</p>
                    </div>
                </div>
                <div class='feature'>
                    <img height="300" src="../../Images/happy.jpg" />
                    <div class='description'>
                        <h2>
                            Josh Davis</h2>
                        <h5>
                            Database Administrator</h5>
                        <p>
                            DBA description</p>
                    </div>
                </div>
                <div class='feature'>
                    <img height="300" src="../../Images/sleepy.jpg" />
                    <div class='description'>
                        <h2>
                            Tahmid Mahmud</h2>
                        <h5>
                            Team Member</h5>
                        <p>
                            Tm description</p>
                    </div>
                </div>
                <div class='feature'>
                    <img height="300" src="../../Images/doc.jpg" />
                    <div class='description'>
                        <h2>
                            Chris Ly</h2>
                        <h5>
                            Team Member</h5>
                        <p>
                            TM description</p>
                    </div>
                </div>
                <div class='feature'>
                    <img height="300" src="../../Images/sneezy.jpg" />
                    <div class='description'>
                        <h2>
                            Mario Ruiz-Laiseca</h2>
                        <h5>
                            Team Member</h5>
                        <p>
                            TM description</p>
                    </div>
                </div>
     </div>
</div>
</asp:Content>
