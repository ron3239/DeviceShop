   M S B A M L   `   `   `  ����O  Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem  5       
DeviceShop7   1DeviceShop.components.screen.EquipmentFailureView   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      6sys&clr-namespace:System;assembly=mscorlib     5      .��5      � $��10q�6     � RowDefinitions  5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   �� $��0��6   $@��:Регистрация сбоев оборудования��6!   $��18(�5      $
��Bold"�6"   $��0,0,0,15q�64   �� 5   
   $��1��6    �� Orientation$ 
Horizontal=�6"   $��0,0,0,10q�6;   .+�5      �� $��Оборудование:��6   $	��150��6-   $��Center=�69   �� 5      -   5         ��Name$ cmbEquipment��5      $	��300��6-    �� DisplayMemberPath$
 Name��69    �� SelectedValuePath$ Id��5      5       �� 5#   
   $��2��6   $ 
Horizontal=�6"   $��0,0,0,10q�6;   .+�5$      �� $��Причина сбоя:��6   $	��150��6-   $��Center=�69   �� 5%      -   5        $ cmbFailureReason��5%      $	��300��61   $ Description��6=   $ Id��5&      5'      �� 5*   
   $��3��6   $ 
Horizontal=�6"   $��0,0,0,10q�6;   .+�5+      �� $'��!Время начала сбоя:��6   $	��150��62   $��Center=�6>   (  "System.Windows.Controls.DatePicker  5,      -   5          Name$ dpStartDate��5,      $	��120��6.   
 �� Now   SelectedDate# Z 6:   �� 5-      -   5         ��Name$ txtStartTime��5-      $��60��6,   $��5,0,0,0q�67   ��5.      �� *	StartTime+	 �� StringFormat$	 HH:mm��5/      �� 52   
   $��4��6   $ 
Horizontal=�6"   $��0,0,0,10q�6;   .+�53      �� $��Заметки:��6   $	��150��6(   $	��Top=�64   �� 54      -   5        $ txtNotes��54      $	��300��6(   $��60��64   
 �� TextWrapping$

 Wrap=�6@    �� AcceptsReturn . " �� VerticalScrollBarVisibility$
 Auto=�55   )   56      �� 59   
   $��5��6   $ 
Horizontal=�6"   $��0,0,0,15q�6;   .+�5:      �� $!��Сообщил о сбое:��6   $	��150��6/   $��Center=�6;   �� 5;      -   5        $ txtReportedBy��5;      $	��200��6-   5<      �� 5?   
   $��6��6   $ 
Horizontal=�6"   $��Right=�6;   .+�5@      �� -   5         ��Name$ btnRegister��5@      $/��)Зарегистрировать сбой��6*   $	��180��6J   $��30��6V   $��0,0,10,0q�5A      6&   �� 5B      -   5        $ 	btnResume��5B      $5��/Зафиксировать устранение��6(   $	��180��6K   $��30��6W   {�.  5C   &   5D      &   System.Windows.Controls.DataGrid  5G   
   -	   5          Name$ 
dgFailures��5G       $��7��6      AutoGenerateColumns .  $��0,15,0,0q�6P      CanUserAddRows .     
IsReadOnly .    Columns 5I      0  *System.Windows.Controls.DataGridTextColumn  5J      ,  &System.Windows.Controls.DataGridColumn   Header$ Оборудование��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$
 1.5* 6V   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6;   �� *Device+6V     5K      $ Причина��6%   $ 2* 6P    66   �� *Error+6P     5L      $ Начало��6%   $ 1* 6t    65   �� *	StartTime+$	 dd.MM.yyyy HH:mm��6t     5M      $ Устранение��6%   $ 1* 6v    69   �� *	EndTime+$	 dd.MM.yyyy HH:mm��6v     5N      $ Длительность��6%   $
 0.8* 6X    6;   �� *
Duration+6X     5O      $ Сообщил��6%   $ 1* 6U    66   �� *
ReportedBy+6U     5P      $ Исправил��6%   $ 1* 6S    67   �� *	FixedBy+6S   5R      5S      5T      