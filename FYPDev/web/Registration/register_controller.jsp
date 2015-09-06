<%-- 
    Document   : register
    Created on : 29-Aug-2015, 18:37:27
    Author     : pheni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../resources.jsp" %>
        <script src="../resources/js/gen_validatorv4.js" type="text/javascript"></script>
        <script>
          function MaterialSelect(element) {
  'use strict';

  this.element_ = element;
  this.maxRows = this.Constant_.NO_MAX_ROWS;
  // Initialize instance.
  this.init();
}

MaterialSelect.prototype.Constant_ = {
  NO_MAX_ROWS: -1,
  MAX_ROWS_ATTRIBUTE: 'maxrows'
};

MaterialSelect.prototype.CssClasses_ = {
  LABEL: 'mdl-textfield__label',
  INPUT: 'mdl-select__input',
  IS_DIRTY: 'is-dirty',
  IS_FOCUSED: 'is-focused',
  IS_DISABLED: 'is-disabled',
  IS_INVALID: 'is-invalid',
  IS_UPGRADED: 'is-upgraded'
};

MaterialSelect.prototype.onKeyDown_ = function(event) {
  'use strict';

  var currentRowCount = event.target.value.split('\n').length;
  if (event.keyCode === 13) {
    if (currentRowCount >= this.maxRows) {
      event.preventDefault();
    }
  }
};

MaterialSelect.prototype.onFocus_ = function(event) {
  'use strict';

  this.element_.classList.add(this.CssClasses_.IS_FOCUSED);
};

MaterialSelect.prototype.onBlur_ = function(event) {
  'use strict';

  this.element_.classList.remove(this.CssClasses_.IS_FOCUSED);
};

MaterialSelect.prototype.updateClasses_ = function() {
  'use strict';
  this.checkDisabled();
  this.checkValidity();
  this.checkDirty();
};

MaterialSelect.prototype.checkDisabled = function() {
  'use strict';
  if (this.input_.disabled) {
    this.element_.classList.add(this.CssClasses_.IS_DISABLED);
  } else {
    this.element_.classList.remove(this.CssClasses_.IS_DISABLED);
  }
};

MaterialSelect.prototype.checkValidity = function() {
  'use strict';
  if (this.input_.validity.valid) {
    this.element_.classList.remove(this.CssClasses_.IS_INVALID);
  } else {
    this.element_.classList.add(this.CssClasses_.IS_INVALID);
  }
};

MaterialSelect.prototype.checkDirty = function() {
  'use strict';
  if (this.input_.value && this.input_.value.length > 0) {
    this.element_.classList.add(this.CssClasses_.IS_DIRTY);
  } else {
    this.element_.classList.remove(this.CssClasses_.IS_DIRTY);
  }
};

MaterialSelect.prototype.disable = function() {
  'use strict';

  this.input_.disabled = true;
  this.updateClasses_();
};

MaterialSelect.prototype.enable = function() {
  'use strict';

  this.input_.disabled = false;
  this.updateClasses_();
};

MaterialSelect.prototype.change = function(value) {
  'use strict';

  if (value) {
    this.input_.value = value;
  }
  this.updateClasses_();
};

MaterialSelect.prototype.init = function() {
  'use strict';

  if (this.element_) {
    this.label_ = this.element_.querySelector('.' + this.CssClasses_.LABEL);
    this.input_ = this.element_.querySelector('.' + this.CssClasses_.INPUT);

    if (this.input_) {
      if (this.input_.hasAttribute(this.Constant_.MAX_ROWS_ATTRIBUTE)) {
        this.maxRows = parseInt(this.input_.getAttribute(
            this.Constant_.MAX_ROWS_ATTRIBUTE), 10);
        if (isNaN(this.maxRows)) {
          this.maxRows = this.Constant_.NO_MAX_ROWS;
        }
      }

      this.boundUpdateClassesHandler = this.updateClasses_.bind(this);
      this.boundFocusHandler = this.onFocus_.bind(this);
      this.boundBlurHandler = this.onBlur_.bind(this);
      this.input_.addEventListener('input', this.boundUpdateClassesHandler);
      this.input_.addEventListener('focus', this.boundFocusHandler);
      this.input_.addEventListener('blur', this.boundBlurHandler);

      if (this.maxRows !== this.Constant_.NO_MAX_ROWS) {
        // TODO: This should handle pasting multi line text.
        // Currently doesn't.
        this.boundKeyDownHandler = this.onKeyDown_.bind(this);
        this.input_.addEventListener('keydown', this.boundKeyDownHandler);
      }

      this.updateClasses_();
      this.element_.classList.add(this.CssClasses_.IS_UPGRADED);
    }
  }
};

MaterialSelect.prototype.mdlDowngrade_ = function() {
  'use strict';
  this.input_.removeEventListener('input', this.boundUpdateClassesHandler);
  this.input_.removeEventListener('focus', this.boundFocusHandler);
  this.input_.removeEventListener('blur', this.boundBlurHandler);
  if (this.boundKeyDownHandler) {
    this.input_.removeEventListener('keydown', this.boundKeyDownHandler);
  }
};

// The component registers itself. It can assume componentHandler is available
// in the global scope.
componentHandler.register({
  constructor: MaterialSelect,
  classAsString: 'MaterialSelect',
  cssClass: 'mdl-js-select',
  widget: true
});
    </script>
    <style>
         .mdl-select {
          position: relative;
          font-size: 16px;
          display: inline-block;
          box-sizing: border-box;
          width: 300px;
          max-width: 100%;
          margin: 0;
          padding: 20px 0;
        }

        .mdl-select__input {
          border: none;
          border-bottom: 1px solid rgba(0,0,0, 0.12);
          display: inline-block;
          font-size: 16px;
          margin: 0;
          padding: 4px 0;
          width: 100%;
          background: 16px;
          text-align: left;
          color: inherit;
        }

        .mdl-select.is-focused .mdl-select__input {
            outline: none; 
        }
        .mdl-select.is-invalid .mdl-select__input { 
          border-color: rgb(222, 50, 38);
          box-shadow: none;
          }

        .mdl-select.is-disabled .mdl-select__input {
          background-color: transparent;
          border-bottom: 1px dotted rgba(0,0,0, 0.12);
        }

        .mdl-select__label {
          bottom: 0;
          color: rgba(0,0,0, 0.26);
          font-size: 16px;
          left: 0;
          right: 0;
          pointer-events: none;
          position: absolute;
          top: 24px;
          width: 100%;
          overflow: hidden;
          white-space: nowrap;
          text-align: left; 
        }

        .mdl-select.is-dirty .mdl-select__label { visibility: hidden; }

        .mdl-select--floating-label .mdl-textfield__label {
          -webkit-transition-duration: 0.2s;
          transition-duration: 0.2s;
          -webkit-transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
          transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
        }

        .mdl-select--floating-label.is-focused .mdl-select__label,
        .mdl-select--floating-label.is-dirty .mdl-select__label {
          color: rgb(63,81,181);
          font-size: 12px;
          top: 4px;
          visibility: visible;
        }

        .mdl-select--floating-label.is-focused .mdl-select__expandable-holder .mdl-select__label,
        .mdl-select--floating-label.is-dirty .mdl-select__expandable-holder .mdl-select__label {
          top: -16px;
        }

        .mdl-select--floating-label.is-invalid .mdl-select__label {
          color: rgb(222, 50, 38);
          font-size: 12px;
        }

        .mdl-select__label:after {
          background-color: rgb(63,81,181);
          bottom: 20px;
          content: '';
          height: 2px;
          left: 45%;
          position: absolute;
          -webkit-transition-duration: 0.2s;
          transition-duration: 0.2s;
          -webkit-transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
          transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
          visibility: hidden;
          width: 10px;
        }

        .mdl-select.is-focused .mdl-select__label:after {
          left: 0;
          visibility: visible;
          width: 100%; 
        }

        .mdl-select.is-invalid .mdl-select__label:after {
          background-color: rgb(222, 50, 38); 
        }

        .mdl-select__error {
          color: rgb(222, 50, 38);
          position: absolute;
          font-size: 12px;
          margin-top: 3px;
          visibility: hidden;
        }

        .mdl-select.is-invalid .mdl-select__error {
          visibility: visible;
        }

        .mdl-select__expandable-holder {
          display: inline-block;
          position: relative;
          margin-left: 32px;
          -webkit-transition-duration: 0.2s;
          transition-duration: 0.2s;
          -webkit-transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
          transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
          display: inline-block;
          max-width: 0.1px; 
        }

        .mdl-select.is-focused .mdl-select__expandable-holder, .mdl-select.is-dirty .mdl-select__expandable-holder {
          max-width: 600px; 
        }

        .mdl-select__expandable-holder .mdl-select__label:after {
          bottom: 0;
        }
    </style>
    </head>
    <body>
       <form id="regForm" action="Registration/registerDB.jsp" method="post">
            <table>
                <tr>
                    <td>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" id="reg_userID" name="reg_userID">
                        <label class="mdl-textfield__label" for="sample1">UserID</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" id="reg_username" name="reg_username" type="text">
                            <label class="mdl-textfield__label" for="reg_username">Username</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfiled--floating-label">
                            <input class="mdl-textfield__input" id="reg_password1" name="reg_password1" type="password">
                            <label class="mdl-textfield__label" for="reg_password1">Password</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" id="reg_password2" name="reg_password2" type="password">
                            <label class="mdl-textfield__label" for="reg_password2">Re-enter Password</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="mdl-select mdl-js-select mdl-select--floating-label">
                            <select class="mdl-select__input" id="reg_usertype" name="reg_usertype">
                                <option value="1">Admin</option>
                                <option value="2">Pentadbir/Ketua Jabatan</option>
                                <option value="3">Pensyarah</option>
                            </select>
                            <label class="mdl-select__label" for="reg_usertype">User Type</label>
                        </div>
                    </td>
                </tr>
                <tr>
                            <td>
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input" type="text" id="reg_jabatan" name="reg_jabatan">
                                    <label class="mdl-textfield__label" for="reg_jabatan">Department</label>
                                </div>
                            </td>
                </tr>
                <tr>
                            <td>
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <input class="mdl-textfield__input" type="text" id="reg_name" name="reg_name">
                                    <label class="mdl-textfield__label" for="reg_name">Name</label>
                                </div>
                            </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-color--blue" type="submit">Register</button></td>
                </tr>
            </table>
        </form>
        <script type="text/javascript">
            var validator = new Validator("regForm");
            
            validator.addValidation("regUserID","req","User ID is required");
            validator.addValidation("regUserID","alphanumeric","User ID should contain alphanumeric(A-Z,0-9) characters only");
            
            validator.addValidation("regUsername","req","Username is required");
            validator.addValidation("regUsername","alphanumeric","Username should contain alphanumeric(A-Z,0-9) characters only");
            
            validator.addValidation("regPassword1","req","Passsword is required");
            validator.addValidation("regPassword1","maxlen = 18","Password should be within 6 to 18 character");
            validator.addValidation("regPassword1","minlen = 6","Password should be within 6 to 18 character");
            validator.addValidation("regPassword1","alphanumeric","Password should contain alphanumeric(A-Z,0-9) characters only");

            validator.addValidation("regPassword2","eqelmnt=reg_password1","The entered password does not match");
    
            validator.addValidation("regJabatan","req","Department is required");
            validator.addValidation("regJabatan","alphabetic","Department should contain alphbetical(A-Z) characters only");
            
            validator.addValidation("reg_name","req","Name is required");
            validator.addValidation("reg_name","alphabetic","Name should contain alphbetical(A-Z) characters only");
            </script>
    </body>
</html>
