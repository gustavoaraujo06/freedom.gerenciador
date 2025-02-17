"use client";

import { cilHamburgerMenu, cilPaperclip, cilSpeedometer } from "@coreui/icons";
import CIcon from "@coreui/icons-react";
import styles from "./appSidebar.module.scss";
import {
  CBadge,
  CImage,
  CNavItem,
  CNavTitle,
  CSidebar,
  CSidebarBrand,
  CSidebarHeader,
  CSidebarNav,
  CSidebarToggler,
} from "@coreui/react-pro";
import { useState, CSSProperties } from "react";

export default function AppSideBar() {
  return (
    <CSidebar
      className={styles.sidebarWrapper + " border-end"}
      colorScheme="dark"
    >
      <CSidebarHeader>
        <CSidebarBrand>
          <CImage src="./images/logo.png" height={32}></CImage>
          FreedomIT
        </CSidebarBrand>
      </CSidebarHeader>
      <CSidebarNav>
        <CNavItem href="/">
          <CIcon customClassName="nav-icon" icon={cilSpeedometer} /> Dashboard
          <CBadge className={styles.badgePurple + " ms-2"}>NEW</CBadge>
        </CNavItem>
        <CNavItem href="/notas">
          <CIcon customClassName="nav-icon" icon={cilPaperclip} /> Notas
        </CNavItem>
      </CSidebarNav>
    </CSidebar>
  );
}
