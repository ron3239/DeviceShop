   M S B A M L   `   `   `  ���� O  Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem   
DeviceShop7   1DeviceShop.components.screen.EquipmentFailureView   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     6sys&clr-namespace:System;assembly=mscorlib     .��� $��10q�  � RowDefinitions  �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* �.+��� $��0��$@��:Регистрация сбоев оборудования��$��18(�$
��Bold"�$��0,0,0,15q��� $��1�� �� Orientation$ 
Horizontal=�$��0,0,0,10q�.+��� $��Оборудование:��$	��150��$��Center=��� -    ��Name$ cmbEquipment��$	��300�� �� DisplayMemberPath$
 Name�� �� SelectedValuePath$ Id���� $��2��$ 
Horizontal=�$��0,0,0,10q�.+��� $��Причина сбоя:��$	��150��$��Center=��� -   $ cmbFailureReason��$	��300��$ Description��$ Id���� $��3��$ 
Horizontal=�$��0,0,0,10q�.+��� $'��!Время начала сбоя:��$	��150��$��Center=�(  "System.Windows.Controls.DatePicker  -     Name$ dpStartDate��$	��120��
 �� Now   SelectedDate# Z �� -    ��Name$ txtStartTime��$��60��$��5,0,0,0q����� *	StartTime+	 �� StringFormat$	 HH:mm���� $��4��$ 
Horizontal=�$��0,0,0,10q�.+��� $��Заметки:��$	��150��$	��Top=��� -   $ txtNotes��$	��300��$��60��
 �� TextWrapping$

 Wrap=� �� AcceptsReturn . " �� VerticalScrollBarVisibility$
 Auto=��� $��5��$ 
Horizontal=�$��0,0,0,15q�.+��� $!��Сообщил о сбое:��$	��150��$��Center=��� -   $ txtReportedBy��$	��200���� $��6��$ 
Horizontal=�$��Right=�.+��� -    ��Name$ btnRegister��$/��)Зарегистрировать сбой��$	��180��$��30��$��0,0,10,0q��� -   $ 	btnResume��$5��/Зафиксировать устранение��$	��180��$��30��{�.  &   System.Windows.Controls.DataGrid  -	     Name$ 
dgFailures��$��7��   AutoGenerateColumns .  $��0,15,0,0q�   CanUserAddRows .     
IsReadOnly .    Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Оборудование��   Width5  /System.Windows.Controls.DataGridLengthConverter$
 1.5* 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Device+  $ Причина��$ 2*  �� *Error+  $ Начало��$ 1*  �� *	StartTime+$	 dd.MM.yyyy HH:mm��  $ Устранение��$ 1*  �� *	EndTime+$	 dd.MM.yyyy HH:mm��  $ Длительность��$
 0.8*  �� *
Duration+  $ Сообщил��$ 1*  �� *
ReportedBy+  $ Исправил��$ 1*  �� *	FixedBy+