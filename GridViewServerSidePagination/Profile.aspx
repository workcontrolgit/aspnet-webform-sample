﻿<%@ Page Title="Employee Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebFormBoostrap.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        function showModal(profileId, name, address, email, mobile, status) {
            var modal = $('#infoModal');
            modal.find('.modal-title').text('Profile Info for ' + name);
            modal.find('.modal-body #profileInfo').html(
                '<p>Profile ID: ' + profileId + '</p>' +
                '<p>Name: ' + name + '</p>' +
                '<p>Address: ' + address + '</p>' +
                '<p>Email: ' + email + '</p>' +
                '<p>Mobile: ' + mobile + '</p>' +
                '<p>Status: ' + status + '</p>'
            );
            modal.modal('show');
        }
    </script>
    <asp:UpdatePanel ID="upnEmployee" runat="server">
        <ContentTemplate>
                    Page Size:
                    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="PageSize_Changed">
                        <asp:ListItem Text="10" Value="10" />
                        <asp:ListItem Text="25" Value="25" />
                        <asp:ListItem Text="50" Value="50" />
                    </asp:DropDownList>
                    <asp:GridView ID="gvProfile" DataSourceID="profileDataSource" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvProfile_RowDataBound" OnRowCommand="gvProfile_RowCommand"
                        AllowPaging="true" PagerSettings-Mode="NextPreviousFirstLast" AllowSorting="true" CssClass="table table-striped table-bordered table-hover mt-3" PagerSettings-FirstPageText="First" PagerSettings-LastPageText="Last" PagerSettings-NextPageText="Next" PagerSettings-PreviousPageText="Previous" PagerSettings-Visible="True">

                        <Columns>
                            <asp:BoundField DataField="ProfileId" HeaderText="Profile Id" SortExpression="ProfileId" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                            <asp:TemplateField HeaderText="More Info">
                                <ItemTemplate>
                                    <asp:Button ID="btnMoreInfo" runat="server" Text="More Info" CssClass="btn btn-info" CausesValidation="false"
                                        CommandName="ShowMoreInfo" CommandArgument='<%# Eval("ProfileId") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Modal -->
    <div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="infoModalLabel">Profile Info</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Content will be filled dynamically -->
                    <p id="profileInfo"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <asp:ObjectDataSource ID="profileDataSource" runat="server" SelectMethod="GetProfiles" EnablePaging="true" MaximumRowsParameterName="pageSize"
        StartRowIndexParameterName="startRowIndex" TypeName="WebFormBoostrap.App_Code.ProfileDataSource" SelectCountMethod="TotalRowCount" 
        SortParameterName="sortExpression">
        <SelectParameters>
            <asp:Parameter Name="startRowIndex" Type="Int32" />
            <asp:Parameter Name="pageSize" Type="Int32" />
            <asp:Parameter Name="sortExpression" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
