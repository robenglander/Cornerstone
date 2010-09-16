/*
 * Copyright 2010 the original author or authors.
 * Copyright 2009 Paxxis Technology LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.paxxis.chime.client.editor;

import java.util.List;

import com.extjs.gxt.ui.client.Style.HorizontalAlignment;
import com.extjs.gxt.ui.client.event.ButtonEvent;
import com.extjs.gxt.ui.client.event.ComponentEvent;
import com.extjs.gxt.ui.client.event.SelectionListener;
import com.extjs.gxt.ui.client.util.KeyNav;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.button.ButtonBar;
import com.extjs.gxt.ui.client.widget.form.FormPanel;
import com.extjs.gxt.ui.client.widget.form.TextArea;
import com.extjs.gxt.ui.client.widget.form.TextField;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.DeferredCommand;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.paxxis.chime.client.DataInstanceResponseObject;
import com.paxxis.chime.client.LoginResponseObject;
import com.paxxis.chime.client.ServiceManager;
import com.paxxis.chime.client.ServiceManagerAdapter;
import com.paxxis.chime.client.ServiceManagerListener;
import com.paxxis.chime.client.ServiceResponseObject;
import com.paxxis.chime.client.ShapeResponseObject;
import com.paxxis.chime.client.StateManager;
import com.paxxis.chime.client.common.Community;
import com.paxxis.chime.client.common.DataInstance;
import com.paxxis.chime.client.common.DataInstanceRequest;
import com.paxxis.chime.client.common.DataInstanceResponse;
import com.paxxis.chime.client.common.EditCommunityRequest;
import com.paxxis.chime.client.common.EditCommunityResponse;
import com.paxxis.chime.client.common.Shape;
import com.paxxis.chime.client.common.ShapeRequest;
import com.paxxis.chime.client.pages.PageManager;
import com.paxxis.chime.client.widgets.ChimeMessageBox;
import com.paxxis.chime.client.widgets.ChimeWindow;

/**
 *
 * @author Robert Englander
 */
public class CommunityCreatorWindow extends ChimeWindow
{
    public interface CommunityCreationListener {
        public void onInstanceCreated(Community community);
    }

    private ButtonBar _buttonBar;
    private Button _okButton;
    private Button _cancelButton;
    private FormPanel _form = new FormPanel();
    private TextArea descriptionField;
    private ServiceManagerListener _serviceManagerListener = null;
    private TextField<String> nameField;
    private CommunityCreationListener creationListener;
    private Shape communityShape = null;

    public CommunityCreatorWindow() {
    	this(null);
    }

    public CommunityCreatorWindow(CommunityCreationListener listener) {
        super();
        creationListener = listener;
        setModal(true);
        setHeading("Create Community");
        setMaximizable(false);
        setMinimizable(false);
        setCollapsible(false);
        setClosable(true);
        setResizable(false);
        setWidth(400);
    }

    protected void init() {
    	postInit();
        AsyncCallback callback = new AsyncCallback() {
            public void onFailure(Throwable result) {
            }

            public void onSuccess(final Object result) {
                ShapeResponseObject resp = (ShapeResponseObject)result;
                if (resp.isResponse()) {
                	communityShape = resp.getResponse().getShape();
                	validate();
                }
            }
        };
        
        ShapeRequest req = new ShapeRequest();
        req.setId(Shape.COMMUNITY_ID);
        ServiceManager.getService().sendShapeRequest(req, callback);
    }
    
    protected void postInit() {
        _form.setHeaderVisible(false);
        _form.setBorders(false);
        _form.setBodyBorder(false);
        _form.setStyleAttribute("padding", "5");
        _form.setButtonAlign(HorizontalAlignment.CENTER);
        _form.setFrame(true);
        _form.setFieldWidth(250);
        _form.setLabelWidth(85);

        nameField = new TextField<String>();
        nameField.setFieldLabel("Name");
        new KeyNav(nameField) {
            @Override
            public void onKeyPress(final ComponentEvent cd) {
                DeferredCommand.addCommand(
                    new Command() {
                        public void execute() {
                            validate();
                        }
                    }
                );
            }
        };

        _form.add(nameField);

        descriptionField = new TextArea();
        descriptionField.setFieldLabel("Description");
        new KeyNav(descriptionField) {
            @Override
            public void onKeyPress(final ComponentEvent cd) {
                DeferredCommand.addCommand(
                    new Command() {
                        public void execute() {
                            validate();
                        }
                    }
                );
            }
        };
        _form.add(descriptionField);

        _buttonBar = new ButtonBar();
        _buttonBar.setAlignment(HorizontalAlignment.CENTER);

        _okButton = new Button("Ok");
        _okButton.addSelectionListener(
            new SelectionListener<ButtonEvent>() {
                @Override
                public void componentSelected(ButtonEvent evt) {
                    create();
                }
            }
        );

        _buttonBar.add(_okButton);

        _cancelButton = new Button("Cancel");
        _cancelButton.addSelectionListener(
            new SelectionListener<ButtonEvent>() {
                @Override
                public void componentSelected(ButtonEvent evt) {
                    doCancel();
                }
            }
        );

        _buttonBar.add(_cancelButton);

        _form.add(_buttonBar);
        add(_form);

        _serviceManagerListener = new ServiceManagerAdapter() {
            public void onLoginResponse(LoginResponseObject resp) {
            }
        };

        ServiceManager.addListener(_serviceManagerListener);

        validate();
    }

    protected void create() {
        EditCommunityRequest req = new EditCommunityRequest();
        createInstance(req);
    }

    protected void createInstance(final EditCommunityRequest req) {
        AsyncCallback callback = new AsyncCallback() {
            public void onFailure(Throwable result) {
            }

            public void onSuccess(final Object result) {
                DataInstanceResponseObject resp = (DataInstanceResponseObject)result;
                if (resp.isResponse()) {
                    DataInstanceResponse response = resp.getResponse();
                    List<DataInstance> instances = response.getDataInstances();

                    // if there are others with this name, ask the user to confirm the create.
                    // in the future, we'll show them to the user as part of the confirmation
                    int count = instances.size();
                    if (count > 0) {
                        String msg = "There is already a community with this name.";

                        ChimeMessageBox.alert("Create Community", msg, null);
                    } else {
                        doCreate(req);
                    }
                } else {
                    ChimeMessageBox.alert("Error", resp.getError().getMessage(), null);
                }
            }
        };

        DataInstanceRequest request = new DataInstanceRequest();
        request.setUser(ServiceManager.getActiveUser());
        request.addQueryParameter(communityShape, "name", nameField.getValue().trim());
        ServiceManager.getService().sendDataInstanceRequest(request, callback);
    }

    protected void doCreate(EditCommunityRequest req) {
        AsyncCallback callback = new AsyncCallback() {
            public void onFailure(Throwable result) {
            }

            public void onSuccess(final Object result) {
                ServiceResponseObject<EditCommunityResponse> resp = (ServiceResponseObject<EditCommunityResponse>)result;
                if (resp.isResponse()) {
                    EditCommunityResponse response = resp.getResponse();
                    Community inst = response.getCommunity();
                    if (creationListener != null) {
                        creationListener.onInstanceCreated(inst);
                    } else {
                        PageManager.instance().openNavigator(true, inst);
                        StateManager.instance().pushInactiveToken("detail:" + inst.getId());
                    }
                    doCancel();
                } else {
                    ChimeMessageBox.alert("Error", resp.getError().getMessage(), null);
                }
            }
        };

        req.setUser(ServiceManager.getActiveUser());

        req.setName(nameField.getValue().trim());
        req.setDescription(descriptionField.getValue());
        req.setOperation(EditCommunityRequest.Operation.Create);

        // communities are always visible to everyone, and editable by their own moderators.  there's no need
        // to specify that here, as the service makes that happen

        ServiceManager.getService().sendEditCommunityRequest(req, callback);
    }

    private void validate() {
        String name = nameField.getValue();
        String desc = descriptionField.getValue();
        boolean valid = name != null && name.trim().length() > 0 &&
                desc != null && desc.trim().length() > 0;
        _okButton.setEnabled(valid && communityShape != null);
    }

    protected void handleLoginResponse(final LoginResponseObject resp)
    {
        DeferredCommand.addCommand(
            new Command()
            {
                public void execute()
                {
                }
            }
        );
    }

    protected void doCancel()
    {
        ServiceManager.removeListener(_serviceManagerListener);
        hide();
    }

}