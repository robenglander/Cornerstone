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

package com.paxxis.chime.client.widgets;

import com.extjs.gxt.ui.client.Style.HorizontalAlignment;
import com.extjs.gxt.ui.client.Style.Orientation;
import com.extjs.gxt.ui.client.event.ButtonEvent;
import com.extjs.gxt.ui.client.event.SelectionListener;
import com.extjs.gxt.ui.client.util.Margins;
import com.extjs.gxt.ui.client.widget.Html;
import com.extjs.gxt.ui.client.widget.LayoutContainer;
import com.extjs.gxt.ui.client.widget.button.Button;
import com.extjs.gxt.ui.client.widget.button.ButtonBar;
import com.extjs.gxt.ui.client.widget.layout.FitLayout;
import com.extjs.gxt.ui.client.widget.layout.RowData;
import com.extjs.gxt.ui.client.widget.layout.RowLayout;
import com.google.gwt.user.client.Command;
import com.google.gwt.user.client.DeferredCommand;
import com.paxxis.chime.client.common.Comment;
import com.paxxis.chime.client.editor.SimpleTextEditorPanel;

/**
 *
 * @author Robert Englander
 */
public class CommentEditorWindow extends ChimeWindow 
{
    public interface CommentEditorListener
    {
        public void onComplete(Comment comment);
    }
    
    private CommentEditorListener _listener;
    private SimpleTextEditorPanel _editorPanel;
    private Button _okButton;
    private Button _cancelButton;

    private Html _errorLabel;
    private String name;
    
    public CommentEditorWindow(String name, CommentEditorListener listener)
    {
        _listener = listener;
        this.name = name;

        setModal(true);
        setHeading("Create " + name);
        setMaximizable(false);
        setMinimizable(false);
        setClosable(false);
        setResizable(true);
        setWidth(500);
        setHeight(350);
        
    }
    
    protected void init()
    {
        setLayout(new FitLayout());
        
        LayoutContainer cont = new LayoutContainer();
        cont.setLayout(new RowLayout(Orientation.VERTICAL));

        _editorPanel = new SimpleTextEditorPanel("");
        
        _editorPanel.setChangeListener(
            new SimpleTextEditorPanel.EditorPanelChangeListener()
            {
                public void onChange() 
                {
                    validate();
                }
            }
        );

        cont.add(_editorPanel, new RowData(1, 1, new Margins(7, 5, 3, 5)));
        
        ButtonBar bar = new ButtonBar();
        bar.setAlignment(HorizontalAlignment.CENTER);
        
        _okButton = new Button("Ok");
        _okButton.addSelectionListener(
            new SelectionListener<ButtonEvent>()
            {
                @Override
                public void componentSelected(ButtonEvent evt) 
                {
                    notifyComplete();
                    hide();
                }
            
            }
        );

        _errorLabel = new Html("<div id='endslice-error-label'>&nbsp;</div>");
        cont.add(_errorLabel, new RowData(1, -1, new Margins(5, 5, 3, 5)));
        
        _cancelButton = new Button("Cancel");
        _cancelButton.addSelectionListener(
            new SelectionListener<ButtonEvent>()
            {
                @Override
                public void componentSelected(ButtonEvent evt) 
                {
                    hide();
                }
            
            }
        );

        bar.add(_okButton);
        bar.add(_cancelButton);
        
        cont.add(bar);
        
        _editorPanel.initialize();

        add(cont);
        
        DeferredCommand.addCommand(
            new Command()
            {
                public void execute()
                {
                    validate();
                }
            }
        );
    }
    
    private void notifyComplete()
    {
        String comment = _editorPanel.getText();
        
        Comment newComment = new Comment();
        newComment.setDescription(comment);
        
        _listener.onComplete(newComment);
    }
    
    private void validate()
    {
        String error = "&nbsp;";
        boolean valid = true;
        
        if (_editorPanel.getText().trim().length() == 0)
        {
            error = "Comment can't be empty.";
            valid = false;
        }

        _okButton.setEnabled(valid);
        _errorLabel.setHtml("<div id='endslice-error-label'>" + error + "</div>");
    }
}