"use client";
import { CBreadcrumb, CBreadcrumbItem } from "@coreui/react-pro";
import { usePathname } from "next/navigation";

export default function AppBreadcrumb() {
  const pathname = usePathname();
  const pathSegments = pathname.split("/").filter((segment) => segment);
  const lastSegment = pathSegments[pathSegments.length - 1] || "Home";
  const breadcrumbName =
    lastSegment.charAt(0).toUpperCase() + lastSegment.slice(1);
  return (
    <>
      <div className="p-3 fs-4 fw-semibold">{breadcrumbName}</div>
      <CBreadcrumb className="ps-3">
        <CBreadcrumbItem href="/">Home</CBreadcrumbItem>
        {pathSegments.map((segment, index) => {
          const isActive = index === pathSegments.length - 1;
          const href = "/" + pathSegments.slice(0, index + 1).join("/");
          const label = segment.charAt(0).toUpperCase() + segment.slice(1);

          return (
            <CBreadcrumbItem
              key={index}
              {...(isActive ? { active: true } : { href })}
            >
              {label}
            </CBreadcrumbItem>
          );
        })}
      </CBreadcrumb>
    </>
  );
}
