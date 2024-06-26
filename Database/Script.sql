USE [Library-Management-System]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[author_id] [int] IDENTITY(1,1) NOT NULL,
	[author_name] [varchar](255) NULL,
	[author_bio] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Author_AuthorName] UNIQUE NONCLUSTERED 
(
	[author_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](60) NULL,
	[edition] [int] NULL,
	[author_id] [int] NULL,
	[genre_id] [int] NULL,
	[stock_id] [int] NULL,
	[published_year] [date] NULL,
	[author_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrow]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow](
	[borrow_id] [int] IDENTITY(1,1) NOT NULL,
	[member_id] [int] NULL,
	[book_id] [int] NULL,
	[borrow_date] [date] NULL,
	[return_date] [date] NULL,
	[actual_return_date] [date] NULL,
	[fine_amount] [decimal](10, 2) NULL,
	[subscription_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[borrow_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[genre_id] [int] IDENTITY(1,1) NOT NULL,
	[genre_name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[member_id] [int] IDENTITY(1,1) NOT NULL,
	[member_name] [varchar](100) NULL,
	[phone_no] [varchar](20) NULL,
	[dob] [date] NULL,
	[gender] [varchar](10) NULL,
	[subscription_type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[member_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[member_id] [int] NULL,
	[subscription_id] [int] NULL,
	[payment_date] [date] NULL,
	[amount_paid] [decimal](10, 2) NULL,
	[payment_type] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[stock_id] [int] IDENTITY(1,1) NOT NULL,
	[stock_count] [int] NULL,
	[isbn] [varchar](100) NULL,
	[shelf_number] [varchar](50) NULL,
	[section] [varchar](50) NULL,
	[aisle] [varchar](50) NULL,
	[rack] [varchar](50) NULL,
	[book_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[stock_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[subscription_id] [int] IDENTITY(1,1) NOT NULL,
	[member_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[subscription_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscrtption_Type]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscrtption_Type](
	[subscription_id] [int] NULL,
	[monthly_subcription] [decimal](10, 2) NULL,
	[quarter_subscription] [decimal](10, 2) NULL,
	[yearly_subscription] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([author_id])
REFERENCES [dbo].[Author] ([author_id])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([genre_id])
REFERENCES [dbo].[Genre] ([genre_id])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([author_name])
REFERENCES [dbo].[Author] ([author_name])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD FOREIGN KEY([book_id])
REFERENCES [dbo].[Book] ([book_id])
GO
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD FOREIGN KEY([member_id])
REFERENCES [dbo].[Members] ([member_id])
GO
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD FOREIGN KEY([subscription_id])
REFERENCES [dbo].[Subscription] ([subscription_id])
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK_Subscription] FOREIGN KEY([subscription_type])
REFERENCES [dbo].[Subscription] ([subscription_id])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK_Subscription]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([member_id])
REFERENCES [dbo].[Members] ([member_id])
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD FOREIGN KEY([subscription_id])
REFERENCES [dbo].[Subscription] ([subscription_id])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([book_id])
REFERENCES [dbo].[Book] ([book_id])
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD FOREIGN KEY([member_id])
REFERENCES [dbo].[Members] ([member_id])
GO
ALTER TABLE [dbo].[Subscrtption_Type]  WITH CHECK ADD FOREIGN KEY([subscription_id])
REFERENCES [dbo].[Subscription] ([subscription_id])
GO
/****** Object:  StoredProcedure [dbo].[AddBook]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddBook]
    @title VARCHAR(60),
    @edition INT,
    @published_year DATE,
    @author_name VARCHAR(255)
AS
BEGIN
    -- Check if the author exists
    IF NOT EXISTS (SELECT 1 FROM Author WHERE author_name = @author_name)
    BEGIN
        -- If the author does not exist, insert the author
        INSERT INTO Author (author_name) VALUES (@author_name);
    END

    -- Insert the book
    INSERT INTO Book (title, edition, published_year, author_name)
    VALUES (@title, @edition, @published_year, @author_name);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddMember]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddMember]
	@member_name VARCHAR(100),
    @phone_no VARCHAR(20),
    @dob DATE,
    @gender VARCHAR(10),
	@subscription_type INT
AS
BEGIN
    INSERT INTO Members (member_name, phone_no, dob, gender,subscription_type)
    VALUES (@member_name, @phone_no, @dob, @gender,@subscription_type);
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteBook]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBook]
    @book_id INT
AS
BEGIN
    DELETE FROM Book
    WHERE
        book_id = @book_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteMember]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMember]
    @member_id INT
AS
BEGIN
    DELETE FROM Members where member_id=@member_id
END;
GO
/****** Object:  StoredProcedure [dbo].[EditMember]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditMember]
    @member_id INT,
    @member_name VARCHAR(100),
    @phone_no VARCHAR(20),
    @dob DATE,
    @gender VARCHAR(10),
	@subscription_type VARCHAR(50)
AS
BEGIN
    UPDATE  Members SET
        member_name = @member_name,
        phone_no = @phone_no,
        dob = @dob,
        gender = @gender,
		subscription_type=@subscription_type
    WHERE
        member_id = @member_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetBook]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBook]
    @book_id INT
AS
BEGIN
SELECT * FROM Book WHERE book_id = @book_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetBookList]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBookList]
AS
BEGIN
    SELECT * FROM Book;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetMember]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMember]
    @member_id INT
AS
BEGIN
SELECT * FROM Members WHERE member_id = @member_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetMemberList]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMemberList]
AS
BEGIN
SELECT * FROM Members;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateBook]    Script Date: 26-06-2024 11:23:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBook]
    @book_id INT,
    @title VARCHAR(60),
    @edition INT,
    @published_year date
AS
BEGIN
    UPDATE Book
    SET
        title = @title,
        edition = @edition,
        published_year = @published_year
    WHERE
        book_id = @book_id;
END;
GO
