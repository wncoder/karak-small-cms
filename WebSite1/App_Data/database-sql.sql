USE [itacademy_webpages1]
GO
/****** Object:  Table [dbo].[htmlcontent]    Script Date: 30-May-18 4:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htmlcontent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pcid] [int] NOT NULL,
	[htmltext] [ntext] NULL,
 CONSTRAINT [PK_htmlcontent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[page_contents]    Script Date: 30-May-18 4:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[page_contents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NOT NULL,
	[title] [nvarchar](1050) NULL,
	[plugid] [int] NOT NULL,
	[sort_position] [int] NULL,
	[pane_name] [nvarchar](150) NULL,
 CONSTRAINT [PK_page_contents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pages]    Script Date: 30-May-18 4:19:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[page_title] [nvarchar](550) NULL,
	[page_descrioption] [ntext] NULL,
	[page_keywords] [nvarchar](1500) NULL,
	[page_name_in_menu] [nvarchar](550) NULL,
	[include_in_menu] [bit] NULL,
	[url] [nvarchar](650) NULL,
	[sort_position] [int] NULL,
	[parent_pid] [int] NULL,
 CONSTRAINT [PK_pages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plugins]    Script Date: 30-May-18 4:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plugins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[plugin_name] [nvarchar](150) NULL,
	[code_file] [nvarchar](1050) NULL,
 CONSTRAINT [PK_plugins] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 30-May-18 4:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 30-May-18 4:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 30-May-18 4:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 30-May-18 4:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 30-May-18 4:19:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[htmlcontent] ON 

INSERT [dbo].[htmlcontent] ([id], [pcid], [htmltext]) VALUES (1, 1, N'<p>serfaefawfawf</p>')
INSERT [dbo].[htmlcontent] ([id], [pcid], [htmltext]) VALUES (2, 2, N'<span>awefaewf</span>')
INSERT [dbo].[htmlcontent] ([id], [pcid], [htmltext]) VALUES (3, 3, N'awefjawegfueaw aewfuyeawgf awefgyaewf')
SET IDENTITY_INSERT [dbo].[htmlcontent] OFF
SET IDENTITY_INSERT [dbo].[page_contents] ON 

INSERT [dbo].[page_contents] ([id], [pid], [title], [plugid], [sort_position], [pane_name]) VALUES (1, 1, N'hello', 1, 0, N'contentPane')
INSERT [dbo].[page_contents] ([id], [pid], [title], [plugid], [sort_position], [pane_name]) VALUES (2, 1, N'second', 1, 1, N'contentPane')
INSERT [dbo].[page_contents] ([id], [pid], [title], [plugid], [sort_position], [pane_name]) VALUES (3, 1, N'third', 1, 2, N'bottomPane')
SET IDENTITY_INSERT [dbo].[page_contents] OFF
SET IDENTITY_INSERT [dbo].[pages] ON 

INSERT [dbo].[pages] ([id], [page_title], [page_descrioption], [page_keywords], [page_name_in_menu], [include_in_menu], [url], [sort_position], [parent_pid]) VALUES (1, N'home 1', N'home1', N'home, home1', N'Home', 1, N'/', 0, NULL)
INSERT [dbo].[pages] ([id], [page_title], [page_descrioption], [page_keywords], [page_name_in_menu], [include_in_menu], [url], [sort_position], [parent_pid]) VALUES (2, N'About 1', N'about 1', N'about', N'About', 1, N'about', 1, NULL)
INSERT [dbo].[pages] ([id], [page_title], [page_descrioption], [page_keywords], [page_name_in_menu], [include_in_menu], [url], [sort_position], [parent_pid]) VALUES (3, N'Contact', N'Conatct', N'contact', N'Contact', 1, N'contact', 2, NULL)
INSERT [dbo].[pages] ([id], [page_title], [page_descrioption], [page_keywords], [page_name_in_menu], [include_in_menu], [url], [sort_position], [parent_pid]) VALUES (4, N'Feedbacks', N'Feedback', N'feedback', N'Feedback', 1, N'contact/feedback', 0, 3)
SET IDENTITY_INSERT [dbo].[pages] OFF
SET IDENTITY_INSERT [dbo].[plugins] ON 

INSERT [dbo].[plugins] ([id], [plugin_name], [code_file]) VALUES (1, N'htmlmodule', N'~/plugins/html/view.cshtml')
INSERT [dbo].[plugins] ([id], [plugin_name], [code_file]) VALUES (2, N'news-list', N'~/plugins/news/list.cshtml')
SET IDENTITY_INSERT [dbo].[plugins] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserProf__A9D1053472BA9125]    Script Date: 30-May-18 4:19:13 PM ******/
ALTER TABLE [dbo].[UserProfile] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__webpages__8A2B61602B051B9A]    Script Date: 30-May-18 4:19:13 PM ******/
ALTER TABLE [dbo].[webpages_Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[webpages_Membership] ADD  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
GO
ALTER TABLE [dbo].[page_contents]  WITH CHECK ADD  CONSTRAINT [FK_page_contents_pages] FOREIGN KEY([pid])
REFERENCES [dbo].[pages] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[page_contents] CHECK CONSTRAINT [FK_page_contents_pages]
GO
ALTER TABLE [dbo].[page_contents]  WITH CHECK ADD  CONSTRAINT [FK_page_contents_plugins] FOREIGN KEY([plugid])
REFERENCES [dbo].[plugins] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[page_contents] CHECK CONSTRAINT [FK_page_contents_plugins]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
