   M S B A M L   `   `   `  ����E  ADeviceShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullK*clr-namespace:DeviceShop.components.screenDeviceShop.components.screen  5      6    0DeviceShop.components.screen.AccountingEquipment   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      <local*clr-namespace:DeviceShop.components.screen     5        N� Title$  AccountingEquipment��5	      .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��2* �6   �� 5      $��3* �6   �� 5      $��3* �6   �� 5      $��3* �6   �� 5      $��3* �6    � ColumnDefinitions 5   
   �� 5      �� 5      $��3* �6   �� 5      .+�5   
   �� $��0��6   $��3��6"    �� Orientation$ 
Horizontal=�66   $��10q�6O   $��Center=�6[   .+�5      �� $��Center=�6   $��0,0,10,0q�63   Поиск по марке:6V   �� 5      -   5         ��Name$ SearchTextBox��5      $	��300��6-    �� 	MaxLength$	 100��69   5      �� 5      $��Center=�6   $��10,0,0,0q�63   
�������$��Italic$�6W   ywИспользуйте ? для любой последовательности и ! для одного символа5!      5"      �� 5$   
   $��1��6   $��1��6!   
���   �$��Center=�6D   $��Center=�6a   $��30(�6|   #!Учет оборудования6�   �� 5%   
   $��1��6   $��1��6!   
�������$��Center=�6D   $��Center=�6a   $��30(�6|   6�   &   System.Windows.Controls.DataGrid  5'   
   -   5          Name$ DataGrid��5'   r   $��2��6@   $��4��6M   $��3��6^      AutoGenerateColumns .  $��10q�6�      Columns 5(      0  *System.Windows.Controls.DataGridTextColumn  5*      ,  &System.Windows.Controls.DataGridColumn	   Header$	 ID статьи��6%   
   Width5  /System.Windows.Controls.DataGridLengthConverter$

 Auto 6V   1  +System.Windows.Controls.DataGridBoundColumn   Binding 68   �� *	ArticleId+6V     5+      $	 Наименование��6%   $

 Auto 6T    6;   �� *Name+6T     5,      $	 Количество��6%   $

 Auto 6S    69   �� *Count+6S     5-      $	 Цена��6%   $

 Auto 6M    63   �� *Price+6M     5.      $	 ID типа��6%   $

 Auto 6X    66   �� *TypeDetailsId+6X     51      $	 Артикул��6%   $	
 150 6V    66   �� *ArticleName+6V     52      $	 ГОСТ��6%   $	
 150 6P    63   �� *
GostName+6P     53      $	 Тип детали��6%   $	
 150 6]    69   �� *TypeDetailsName+6]     54      $'	 !Единица измерения��6%   $	
 150 6]    6@   �� *
UnitName+6]   56      �� 58   
   $��5��6   $��2��6   $��5q�6.   $��Добавить��69   59      5:      