   M S B A M L   `   `   `  ����  
DeviceShop2    ,DeviceShop.components.screen.SelectionWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$%  Выбор компонента��5   	   $	��450��6"   $	��600��6/    � WindowStartupLocation$ CenterOwner=�5   	   .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5	      $��* �6   �� 5
      $
��Auto �6   .+�5   
   �� $��1��6   .@�5      �� $��Accessories��6   .��5      &   System.Windows.Controls.DataGrid  -   5          Name$ AccessoriesList��5         AutoGenerateColumns .     SelectionMode$ Single=�5         
IsReadOnly .    Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Наименование��6-   	   Width5  /System.Windows.Controls.DataGridLengthConverter$	 * 6\   1  +System.Windows.Controls.DataGridBoundColumn
   Binding
 6C   �� *Name+6\     5      $ Ед. изм.��6-   $
	 Auto 6X   
 6?   �� *Unit+6X     5      $ Цена��6-   $
	 Auto 6l   
 6;   �� *Price+ �� StringFormat$ {0:N2}��6l   5      5      �� 5      $��Details��6   .��5        -   5        $ DetailsList��5       .  $ Single=�5       .  5         5!      $ Наименование��6-   $	 * 6\   
 6C   �� *Name+6\     5"      $ Ед. изм.��6-   $
	 Auto 6X   
 6?   �� *Unit+6X     5#      $ Цена��6-   $
	 Auto 6l   
 6;   �� *Price+$ {0:N2}��6l   5%      5&      5'      �� 5)   
   $��2��6    �� Orientation$ 
Horizontal=�6"   $��Right=�6;   $��5q�6W   .+�5*      �� -   5        $��Выбрать��5*      $	��100��6'   $��0,0,10,0q�63   6E   �� 5+      -   5        $��Отмена��5+      $	��100��6&   62   5,      5-      5.      