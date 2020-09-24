#tag Window
Begin ContainerControl MessageControl
   AcceptFocus     =   False
   AcceptTabs      =   False
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   24
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   730
   Begin Task TaskMessage
      Height          =   32
      Index           =   -2147483648
      Left            =   0
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
      Top             =   0
      Width           =   32
      Begin Canvas Icon
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   24
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TaskMessage"
         Left            =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   0
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   24
      End
   End
   Begin Label Message
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   35
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   14.0
      TextUnit        =   0
      Top             =   2
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   687
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub DoMessage(Message As String, Optional Severity As String = "Info")
		  mTimer = 0
		  mSeverity = Severity
		  mMessage = Message
		  TaskMessage.Kill
		  TaskMessage.Run
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init()
		  Message.Text = ""
		  Message.TextColor = &c000000
		  Icon.Backdrop = Nil
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mMessage As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSeverity As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimer As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events TaskMessage
	#tag Event
		Sub Run()
		  mTimer = 0
		  Me.UpdateUI
		  Dim t As Integer
		  t=Ticks
		  While (Ticks-t)< 480 // 480 * 1 / 60 = 8 secondes
		  Wend
		  mTimer = 1
		  Me.UpdateUI
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub UpdateUI(args as Dictionary)
		  #Pragma Unused args
		  
		  If Message <> Nil Then
		    
		    Select Case mTimer
		    Case 0
		      
		      Select Case mSeverity
		      Case "Danger"
		        Message.TextColor = &cCC3300 // Crimson
		        Icon.Backdrop = iconalert
		      Case "Warning"
		        Message.TextColor = &cB26B47  // Yellow
		        Icon.Backdrop = iconcaution
		      Case Else
		        Message.TextColor = &C339900 // Green
		        Icon.Backdrop = iconok
		      End Select
		      Message.Text = mMessage
		      
		    Case 1
		      Message.TextColor = &c000000 // Default Black
		      Icon.Backdrop = Nil
		      Message.Text = ""
		      
		    End Select
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
