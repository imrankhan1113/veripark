GO
/****** Object:  Table [dbo].[BookDetails]    Script Date: 2/2/2016 12:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookDetails](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[ISBN] [nvarchar](25) NOT NULL,
	[PublishYear] [char](4) NOT NULL,
	[CoverPrice] [decimal](12, 6) NOT NULL,
	[CheckOutStatusID] [int] NOT NULL,
	[Image] [image] NULL,
	[CurrentBorrowerID] [int] NULL,
 CONSTRAINT [PK_BookDetails] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BorrowerDetails]    Script Date: 2/2/2016 12:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowerDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Mobile] [nvarchar](11) NOT NULL,
	[NationalID] [nvarchar](11) NOT NULL,
	[CheckOutDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NOT NULL,
	[BookID] [int] NOT NULL,
 CONSTRAINT [PK_BorrowerDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CheckOutStatusDescription]    Script Date: 2/2/2016 12:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckOutStatusDescription](
	[CheckOutStatusID] [int] NOT NULL,
	[CheckOutStatusDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CheckOutStatusDescription] PRIMARY KEY CLUSTERED 
(
	[CheckOutStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[BookDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookDetails_CheckOutStatusDescription] FOREIGN KEY([CheckOutStatusID])
REFERENCES [dbo].[CheckOutStatusDescription] ([CheckOutStatusID])
GO
ALTER TABLE [dbo].[BookDetails] CHECK CONSTRAINT [FK_BookDetails_CheckOutStatusDescription]
GO
/****** Object:  StoredProcedure [dbo].[usp_CheckInBook]    Script Date: 2/2/2016 12:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_CheckInBook]
@BookID int
as

Begin

Declare @ID int 

select @ID = CurrentBorrowerID from BookDetails where BookID = @BookID

Update BorrowerDetails set ReturnDate = getDate() where ID = @ID

Update BookDetails set CheckOutStatusID = '0', CurrentBorrowerID = NULL where BookID = @BookID

End
GO
/****** Object:  StoredProcedure [dbo].[usp_CheckOutBook]    Script Date: 2/2/2016 12:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_CheckOutBook]
@BookID int,
@Name nvarchar(250),
@MobileNo nvarchar(11),
@NationalID nvarchar(11),
@CheckOutDate datetime,
@ReturnDate datetime
as

Begin

Declare @ID int

Insert into BorrowerDetails (Name, Mobile, NationalID, CheckOutDate, ReturnDate, BookID) 
values (@Name, @MobileNo, @NationalID, @CheckOutDate, @ReturnDate, @BookID)

select @ID = Scope_identity()

Update BookDetails set CheckOutStatusID = '1', CurrentBorrowerID = @ID where BookID = @BookID



End
GO
/****** Object:  StoredProcedure [dbo].[usp_getBookBorrowingHistory]    Script Date: 2/2/2016 12:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_getBookBorrowingHistory]
@BookID int

as

select Name, CheckOutDate, ReturnDate from BorrowerDetails where BookID = @BookID

order by CheckOutDate desc
GO
/****** Object:  StoredProcedure [dbo].[usp_getBorrowerDetails]    Script Date: 2/2/2016 12:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_getBorrowerDetails]
@BookID int
as

select Name, Mobile, ReturnDate from BorrowerDetails inner join 
BookDetails on BookDetails.CurrentBorrowerID = BorrowerDetails.ID where
BookDetails.BookID = @BookID
GO
/****** Object:  StoredProcedure [dbo].[usp_RetrieveBookDetails]    Script Date: 2/2/2016 12:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_RetrieveBookDetails] 
@BookID int
as

select 
B.BookID,
B.Title,
B.ISBN,
B.PublishYear,
B.CoverPrice,
B.Image,
D.CheckOutStatusDescription

from BookDetails B inner join CheckOutStatusDescription D 
on 
B.CheckOutStatusID = D.CheckOutStatusID

where B.BookID = @BookID
GO
/****** Object:  StoredProcedure [dbo].[usp_RetrieveBooksList]    Script Date: 2/2/2016 12:50:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_RetrieveBooksList]
as

select 
B.BookID,
B.Title,
B.ISBN,
B.PublishYear,
B.CoverPrice,
D.CheckOutStatusDescription

from BookDetails B inner join CheckOutStatusDescription D 
on 
B.CheckOutStatusID = D.CheckOutStatusID
GO
SET IDENTITY_INSERT [dbo].[BookDetails] ON 

