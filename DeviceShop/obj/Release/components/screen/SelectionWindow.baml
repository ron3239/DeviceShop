   M S B A M L   `   `   `  ����   
DeviceShop2    ,DeviceShop.components.screen.SelectionWindow   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$%  Выбор компонента��$	��450��$	��600�� � WindowStartupLocation$ CenterOwner=�.���  � RowDefinitions �� $
��Auto ��� $��* ��� $
��Auto �.+��� $��1��.@��� $��Accessories��.��&   System.Windows.Controls.DataGrid  -     Name$ AccessoriesList��   AutoGenerateColumns .     SelectionMode$ Single=�   
IsReadOnly .    Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Header$ Наименование��	   Width5  /System.Windows.Controls.DataGridLengthConverter$	 * 1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 �� *Name+  $ Ед. изм.��$
	 Auto 
 �� *Unit+  $ Цена��$
	 Auto 
 �� *Price+ �� StringFormat$ {0:N2}���� $��Details��.��  -   $ DetailsList�� .  $ Single=� .    $ Наименование��$	 * 
 �� *Name+  $ Ед. изм.��$
	 Auto 
 �� *Unit+  $ Цена��$
	 Auto 
 �� *Price+$ {0:N2}���� $��2�� �� Orientation$ 
Horizontal=�$��Right=�$��5q�.+��� -   $��Выбрать��$	��100��$��0,0,10,0q��� -   $��Отмена��$	��100��