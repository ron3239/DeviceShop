﻿#pragma checksum "..\..\..\..\components\screen\EquipmentFailureView.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "5071C85DA4CF1E8742B16A0FB3707165AF2FB627A2D85E9E9A2D95E8F873F804"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace DeviceShop.components.screen {
    
    
    /// <summary>
    /// EquipmentFailureView
    /// </summary>
    public partial class EquipmentFailureView : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 30 "..\..\..\..\components\screen\EquipmentFailureView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cmbEquipment;
        
        #line default
        #line hidden
        
        
        #line 37 "..\..\..\..\components\screen\EquipmentFailureView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox cmbFailureReason;
        
        #line default
        #line hidden
        
        
        #line 44 "..\..\..\..\components\screen\EquipmentFailureView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DatePicker dpStartDate;
        
        #line default
        #line hidden
        
        
        #line 45 "..\..\..\..\components\screen\EquipmentFailureView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox txtStartTime;
        
        #line default
        #line hidden
        
        
        #line 52 "..\..\..\..\components\screen\EquipmentFailureView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox txtNotes;
        
        #line default
        #line hidden
        
        
        #line 59 "..\..\..\..\components\screen\EquipmentFailureView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox txtReportedBy;
        
        #line default
        #line hidden
        
        
        #line 64 "..\..\..\..\components\screen\EquipmentFailureView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnRegister;
        
        #line default
        #line hidden
        
        
        #line 66 "..\..\..\..\components\screen\EquipmentFailureView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnResume;
        
        #line default
        #line hidden
        
        
        #line 71 "..\..\..\..\components\screen\EquipmentFailureView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid dgFailures;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/DeviceShop;component/components/screen/equipmentfailureview.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\components\screen\EquipmentFailureView.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.cmbEquipment = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 2:
            this.cmbFailureReason = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 3:
            this.dpStartDate = ((System.Windows.Controls.DatePicker)(target));
            return;
            case 4:
            this.txtStartTime = ((System.Windows.Controls.TextBox)(target));
            return;
            case 5:
            this.txtNotes = ((System.Windows.Controls.TextBox)(target));
            return;
            case 6:
            this.txtReportedBy = ((System.Windows.Controls.TextBox)(target));
            return;
            case 7:
            this.btnRegister = ((System.Windows.Controls.Button)(target));
            
            #line 65 "..\..\..\..\components\screen\EquipmentFailureView.xaml"
            this.btnRegister.Click += new System.Windows.RoutedEventHandler(this.BtnRegister_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.btnResume = ((System.Windows.Controls.Button)(target));
            
            #line 67 "..\..\..\..\components\screen\EquipmentFailureView.xaml"
            this.btnResume.Click += new System.Windows.RoutedEventHandler(this.BtnResume_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.dgFailures = ((System.Windows.Controls.DataGrid)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

